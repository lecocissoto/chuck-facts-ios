//
//  FactDetailsViewController.swift
//  Chuck Facts
//
//  Created by Leandro Cissoto Ramos on 12/19/18.
//  Copyright © 2018 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SafariServices

class FactDetailsViewController: UIViewController {
    // MARK: Properties
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var factLabel: UILabel!
    
    // MARK: Variables
    var viewModel: FactDetailsViewModel!
    var disposeBag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        viewModel = FactDetailsViewModel()
    }
    
    init(viewModel: FactDetailsViewModel!) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.category.isEmpty ? "Random"
                                           : viewModel.category.capitalized
        
        observeFact()
        observeError()
        observeLoading()
        
        viewModel.requestForFact()
    }
    
    // MARK: Actions
    @IBAction func openInWebTapped(_ sender: UIButton) {
        guard let fact = viewModel.fact.value else { return }
        let safariVC = SFSafariViewController(url: fact.url)
        present(safariVC, animated: true, completion: nil)
    }
    
    // MARK: Helpers
    private func observeFact() {
        viewModel.fact.asObservable()
            .map({ $0?.text })
            .bind(to: factLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.fact.asObservable()
            .map({ $0?.iconUrl })
            .subscribe(onNext: { imageString in
                guard let imageString = imageString else { return }
                DispatchQueue.main.async {
                    self.iconImageView.cacheImage(urlString: imageString)
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func observeError() {
        viewModel.error.asObservable().subscribe(onNext: { [weak self] (requestError) in
            guard let error = requestError else { return }
            FactAlert(title: "Ouch!", message: error.localizedDescription)
                .addAction(title: "Back to list", action: {
                    self?.navigationController?.popToRootViewController(animated: true)
                })
                .addAction(title: "Try again!", style: .default, action: {
                    self?.viewModel.requestForFact()
                })
                .show(in: self)
            
        }).disposed(by: disposeBag)
    }
    
    private func observeLoading() {
        viewModel.isLoading.asObservable().subscribe(onNext: { [weak self] isLoading in
            isLoading ? self?.displaySpinner() : self?.removeSpinner()
        }).disposed(by: disposeBag)
    }
}
