//
//  ResumeViewController.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/17/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

class ResumeViewController: BaseViewController {
    
    //MARK: - Properties
    var userInfo: User?
    private var webservice :Webservice!
    private var resumeViewModel :ResumeViewModel?
    
    //MARK: - IBOutlet
    @IBOutlet var contentTableView : UITableView?
    
    //MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webservice = Webservice()
        
        contentTableView?.delegate = self
        contentTableView?.dataSource = self
        contentTableView?.hideDefaultSeprator()
        
        UserInfoHearderView.registerReusableHeaderView(with: contentTableView)
        TitleHeaderView.registerReusableHeaderView(with: contentTableView)
        DetailCell.registerReusableCell(with: contentTableView)
        
        self.showActivityIndicator()
        resumeViewModel = ResumeViewModel(webservice: webservice, user: userInfo, completion: { [weak self] (error) in
            
            guard let self = self else {return}
            
            self.hideActivityIndicator()
            
            if error != nil {
                error?.showServerErrorInViewController(self){
                    self.navigationController?.popViewController(animated: true)
                }
            } else {
                self.populateUserData()
            }
        })
    }
    
    //MARK: - IBAction
    @IBAction func openURLAction(_ sender: UIButton) {
        self.openURLInSafari(urlString: sender.title(for: .normal))
    }
    
    //MARK: - Function
    func populateUserData() {
        self.navigationItem.title = resumeViewModel?.userInfo?.name ?? ""
        contentTableView?.reloadData()
    }
}

extension ResumeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ((resumeViewModel?.reposListViewModel?.repos?.count ?? 0) > 0) ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 386 : 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0,
            let infoHearderView: UserInfoHearderView = tableView.dequeueReusableHeaderFooterView() { /* Section header with user info */
            
            infoHearderView.populate(userInfo: resumeViewModel?.userInfo)
            return infoHearderView
            
        } else if let titleView: TitleHeaderView = tableView.dequeueReusableHeaderFooterView() { /* Title header for repo section */
            
            titleView.setTitle("Repositorys")
            return titleView
        }
        return UITableViewHeaderFooterView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : (resumeViewModel?.reposListViewModel?.repos?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell: DetailCell = tableView.dequeueReusableCell() {
            
            if indexPath.section != 0,
                let aRepo = resumeViewModel?.reposListViewModel?.repos?[indexPath.row] {/* list down user repos with links */
                
                cell.populateCellWith(name: aRepo.name, description: aRepo.description, link: aRepo.html_url)
                cell.descriptionLabel?.textAlignment = .left
                cell.descriptionLabel?.font = UIFont.appFont(ofSize: 14)
                cell.linkButton?.contentHorizontalAlignment = .left
            } else { /* Setup cell for user bio with blog link */
                cell.populateCellWith(name: resumeViewModel?.userInfo?.bio, description: "", link: resumeViewModel?.userInfo?.blog)
                cell.descriptionLabel?.textAlignment = .center
                cell.descriptionLabel?.font = UIFont.appSemiBoldFont(ofSize: 14)
                cell.linkButton?.contentHorizontalAlignment = .center
            }
            
            /* Hide separator for first row */
            cell.separatorView?.isHidden = indexPath.row == 0 ? true : false
            
            /* Setup link button action*/
            cell.linkButton?.removeTarget(nil, action: nil, for: .allEvents)
            cell.linkButton?.addTarget(self, action: #selector(openURLAction(_:)), for: .touchUpInside)
            return cell
        }
        return UITableViewCell()
    }
}
