//
//  CategoriesListViewController.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/19/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CategoriesListViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: Properties
    var viewModel: CategoriesListViewModel!
    var disposeBag = DisposeBag()
    private var refreshControl = UIRefreshControl()
    
    // MARK: Initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewModel = CategoriesListViewModel()
    }
    
    init(viewModel: CategoriesListViewModel!) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"
        tableView.accessibilityIdentifier = "CategoriesTable"
        // Setups
        observeLoading()
        observeCategories()
        observeError()
        addRefreshControl()
        
        // Request
        viewModel.requestForCategories()
    }
    
    // MARK: Observables setups
    private func observeCategories() {
        viewModel.categories
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "categoryCell",
                                         cellType: CategoryTableViewCell.self)) { _, model, cell in
                                            cell.configureCell(with: model)
            }
            .disposed(by: disposeBag)
        
        Observable
            .zip(tableView.rx.itemSelected, tableView.rx.modelSelected(Category.self))
            .bind { [unowned self] indexPath, model in
                self.viewModel.selectedCategory = model
                self.viewModel.navigate(to: .factSegue)
                self.performSegue(withIdentifier: self.viewModel.destination!.rawValue, sender: self)
                self.tableView.deselectRow(at: indexPath, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    private func observeError() {
        viewModel.error.asObservable().subscribe(onNext: { [weak self] (requestError) in
            guard let error = requestError else { return }
            DispatchQueue.main.async {
                FactAlert(title: "Ouch!", message: error.localizedDescription)
                    .addAction(title: "Try again!", action: {
                        self?.viewModel.requestForCategories()
                    })
                    .show(in: self)
            }
        })
        .disposed(by: disposeBag)
    }
    
    private func observeLoading() {
        viewModel.isLoading.asObservable().subscribe(onNext: { [weak self] isLoading in
            DispatchQueue.main.async {
                isLoading ? self?.displaySpinner() : self?.removeSpinner()
                self?.refreshControl.endRefreshing()
            }
        })
        .disposed(by: disposeBag)
    }
    
    private func addRefreshControl() {
        refreshControl.addTarget(self, action: #selector(request), for: .valueChanged)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
            return
        }
        tableView.addSubview(refreshControl)
    }
    
    @objc private func request() {
        viewModel.requestForCategories()
    }
}

extension CategoriesListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = viewModel.destination else { return }
        
        switch destination {
        case .factSegue:
            guard let nextVC = segue.destination as? FactDetailsViewController else { return }
            nextVC.viewModel.category = viewModel.selectedCategory
        }
    }
}
