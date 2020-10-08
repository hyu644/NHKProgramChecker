//
//  SecondViewController.swift
//  NHKProgramChecker
//
//  Created by hyu on R 2/09/09.
//  Copyright © Reiwa 2 hyu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var nhkProgramList: NHKprogramResponse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        tableView.register(UINib(nibName: "NHKProgramCell", bundle: nil), forCellReuseIdentifier: "ProgramCustomCell")
        
        tableView.rowHeight = 100
        
        let baseUrlStrings = "https://api.nhk.or.jp/v2/pg/"
        let program = "list/"
        let area = "130/"
        let service = "g1/"
        let date = "2020-09-16"
        let key = ".json?key=g02gRsUZDHWCGP6A81m9tWgqW8HtdgS6"
        
        let urlString = baseUrlStrings + program + area + service + date + key
        print(urlString)
        
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!){(data,response,error) in
            if let data = data {
                do{
                    self.nhkProgramList = try JSONDecoder().decode(NHKprogramResponse.self, from: data)
                    print(self.nhkProgramList!)
                }catch(let err) {
                    print("エラーです", err)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let g1 = nhkProgramList?.list.g1{
            return g1.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgramCustomCell", for: indexPath) as! NHKProgramCell
        
        if let g1 = nhkProgramList?.list.g1 {
            let contents = g1[indexPath.row]
            cell.titleLabel.text = contents.title
            cell.subTitleLabel.text = contents.subtitle
            
            let date = ISO8601DateFormatter().date(from: contents.start_time)
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            
            cell.timeLabel.text = formatter.string(from: date!)
        }
        return cell
    }
}
