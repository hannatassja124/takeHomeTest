//
//  ViewController.swift
//  takeHomeTest
//
//  Created by Hannatassja Hardjadinata on 16/09/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    let cellID: String = "CustomCell"
    var items : [Product] = []
    
    let url: String = "https://fakestoreapi.com/products"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getData()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil) , forCellReuseIdentifier: cellID)

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func getData(){
        AF.request(url, method: .get).response { [self] response in
            guard let data = response.data else {return}
            do {
                let decoder = JSONDecoder()
                let itemData = try decoder.decode([Product].self, from: data)
                itemData.forEach{item in
                    items.append(item)
                }
                print(itemData[0].id)
                self.tableView.reloadData()
            }catch let error{
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
        cell.product = items[indexPath.row]
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        cell.contentView.layoutMargins = .init(top: 0.0, left: 23.5, bottom: 0.0, right: 23.5)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

