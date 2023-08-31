//
//  ViewController.swift
//  NewsReader
//
//  Created by Калякин Дима  on 07.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let service = NewsService()
        let viewModel = HeadlinesViewModel(service: service)
        let viewController = HeadlinesViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: false)
    }

}

