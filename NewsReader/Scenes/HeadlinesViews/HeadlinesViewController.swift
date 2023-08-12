//
//  HeadlinesViewController.swift
//  NewsReader
//
//  Created by Калякин Дима  on 11.08.2023.
//

import UIKit
import RxSwift
import RxDataSources

final class HeadlinesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    typealias ViewModel = HeadlinesViewModel
    
    private lazy var dataSource = RxTableViewSectionedAnimatedDataSource<NewsSection> { dataSource, tableView, IndexPath, item in
        fatalError()
    }
    
    let viewModel: ViewModel
    
    private var disposeBag = DisposeBag()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HeadlinesViewController{
    
    
    func configureViews (){
        configureTableView()
    }
    
    func configureTableView(){
        viewModel
            .headline
            .drive(
                tableView.rx.items(dataSource: dataSource)
            )
            .disposed(by: disposeBag)
    }
}
