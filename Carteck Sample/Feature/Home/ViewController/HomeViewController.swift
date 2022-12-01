//
//  ViewController.swift
//  Carteck Sample
//
//  Created by Apple on 25/11/22.
//

import UIKit

protocol HomeVCViewModelProtocol{
    func fetchPeople()
}

class HomeViewController: NibViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var people: People?
    private var viewModel: HomeVCViewModelProtocol?
    
    //MARK: - Life cycle methods
    init(viewModel: HomeVCViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(PeopleTVCell.self)
        // Do any additional setup after loading the view.
        self.startFetchingAndLoading()
    }

    private func startFetchingAndLoading(){
        self.showLoading()
        self.viewModel?.fetchPeople()
    }

}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PeopleTVCell.identifier , for: indexPath) as? PeopleTVCell, let userElement = self.people?[indexPath.row]{
            
            cell.confinureUI(userElement: userElement)
            return cell
        }else{
            return UITableViewCell()
        }
    }
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let userElement = self.people?[indexPath.row]{
            let vc = PeopleDetailVCComposer.makePeopleDetailVC(userElement: userElement)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController: HomeVCPresenter{
    func peopleHandler(peoples: People) {
        main.async {
            self.people = peoples
            self.hideLoading()
            self.tableView.reloadData()
        }
    }
    
    func failureHandler(info: AlertInfo) {
        main.async {
            self.hideLoading()
            self.showAlert(alertInfo: info)
        }
    }
}

extension HomeViewController: AlertBehavior, LoadingBehavior { }
