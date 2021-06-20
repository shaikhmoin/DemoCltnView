//
//  CartViewController.swift
//  DemoCltnView
//
//  Created by Moin Shaikh on 20/06/21.
//

import UIKit

class ShoppingCartViewController: UIViewController {

    @IBOutlet weak var tblList: UITableView!
    @IBOutlet var tblBottom: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }
    
    //MARK:- Setup UI
    func setupUI() {
        self.tblList.register(UINib(nibName: "ShoppingCartTableViewCell", bundle: nil), forCellReuseIdentifier: "ShoppingCartTableViewCell")
        
        tblList.delegate = self
        tblList.dataSource = self
        tblList.tableFooterView = tblBottom
    }
    
    //MARk:- Button back click
    @IBAction func btnBackClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- Tableview delegate
extension ShoppingCartViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let settingVCObj = self.storyboard?.instantiateViewController(withIdentifier: "idItemDetailsVC") as! ItemDetailsVC
//        //wishlistVCObj.isFromMenu = true
//        self.navigationController?.pushViewController(settingVCObj, animated: true)
    }
}

extension ShoppingCartViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCartTableViewCell") as! ShoppingCartTableViewCell
        
//        cell?.lblDesc.text = arrMenuDet[indexPath.row]
//        cell?.imgMenu.image = UIImage(named: arrMenuImg[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
