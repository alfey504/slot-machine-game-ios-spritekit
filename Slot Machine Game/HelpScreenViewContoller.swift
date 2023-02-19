//
//  HelpScreenViewContoller.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-02-17.
//

import UIKit

class HelpScreenViewContoller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let BACK_TO_GAME_SEGUE = "back_to_game"
    
    let HEADER_CELL_IDENTIFIER = "header"
    let ITEM_CELL_IDENTIFIER = "listItem"
    let directionList = DirectionsList()
    
    @IBOutlet weak var directionListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        directionListTableView.delegate = self
        directionListTableView.dataSource = self
        
        for _ in 0...10{
            let directions = [
                "Vasu",
                "Abbhi kuttan",
                "sudalamani"
            ]
            
            directionList.addDirection(header: "Sudalamani", directions: directions)
        }
       
        print(directionList.itemAt(at: 1))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return directionList.length
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(directionList.itemAt(at: indexPath.row).ItemType == .headerItem){
            let cell: HeaderCell = tableView.dequeueReusableCell(withIdentifier: HEADER_CELL_IDENTIFIER, for: indexPath) as! HeaderCell
            cell.setHeader(header: directionList.itemAt(at: indexPath.row).ItemValue)
            return cell
        }else{
            let cell: ItemCell = tableView.dequeueReusableCell(withIdentifier: ITEM_CELL_IDENTIFIER, for: indexPath) as! ItemCell
            cell.setItem(item: directionList.itemAt(at: indexPath.row).ItemValue)
            return cell
        }
    }
    
    @IBAction func backToGameButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: BACK_TO_GAME_SEGUE, sender: self)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
