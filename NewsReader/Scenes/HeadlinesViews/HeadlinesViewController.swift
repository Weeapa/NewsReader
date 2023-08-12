//
//  HeadlinesViewController.swift
//  NewsReader
//
//  Created by Калякин Дима  on 11.08.2023.
//

import UIKit
import RxSwift

final class HeadlinesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    typealias ViewModel = HeadlinesViewModel
    
    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
