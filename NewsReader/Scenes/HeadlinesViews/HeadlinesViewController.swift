//
//  HeadlinesViewController.swift
//  NewsReader
//
//  Created by Калякин Дима  on 11.08.2023.
//

import UIKit
import RxSwift
import RxDataSources

private enum Constans{
    static let headlineCell = "headline-cell"
}

final class HeadlinesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    typealias ViewModel = HeadlinesViewModel
    
    private lazy var dataSource = RxTableViewSectionedAnimatedDataSource<NewsSection> { (dataSource,
                                                                                         tableView: UITableView, IndexPath, item) in
        let cell = tableView.dequeueReusableCell(withIdentifier: Constans.headlineCell) as! HeadlineCell
       
        cell.configure(with: item)
        return cell
     
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
}

private extension HeadlinesViewController{
    
    
    func configureViews (){
        configureTableView()
    }
    
    func configureTableView(){
        let nib = UINib(nibName: "HeadlineCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constans.headlineCell)
        
        
        viewModel
            .headlines
            .drive(
                tableView.rx.items(dataSource: dataSource)
            )
            .disposed(by: disposeBag)
    }
}
