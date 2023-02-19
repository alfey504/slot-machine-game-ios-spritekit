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
        
        
        var header = "How To"
        var directions = [
            "Tap the bet text box to enter a bet",
            "Once you enter the bet press on the Spin button",
            "Slot machine will give a pattern of fruits",
            "Based on the patterns you will get a winning",
            "refer below for how the winnings and probabilites of each items work",
            "the winning amount is a multiple of the bet you placed",
            "Every time you win a slot you might also have a chance of winning jackpot",
            "Jackpot is incremented every time a bet is lost"
        ]
        
        directionList.addDirection(header: header, directions: directions)
        
        header = "Winnings"
        directions = [
            
            "1 x Bad Apple = bet * 0",
            "1 x Orange = bet * 1",
            "1 x Peach = bet * 1",
            "1 x Avocado = bet * 1",
            "1 x Strawberry = bet * 1",
            "1 x Banana = bet * 1",
            "1 x Apple = bet * 1",
            "1 x Lemon = bet * 7",
            
            "2 x Bad Apple = bet * 0",
            "2 x Orange = bet * 2",
            "2 x Peach = bet * 2",
            "2 x Avocado = bet * 3",
            "2 x Strawberry = bet * 4",
            "2 x Banana = bet * 5",
            "2 x Apple = bet * 10",
            "2 x Lemon = bet * 20",
            
            "3 x Bad Apple = bet * 0",
            "3 x Orange = bet * 10",
            "3 x Peach = bet * 20",
            "3 x Avocado = bet * 30",
            "3 x Strawberry = bet * 40",
            "3 x Banana = bet * 50",
            "3 x Apple = bet * 75",
            "3 x Lemon = bet * 100",
            
        ]
        
        directionList.addDirection(header: header, directions: directions)
        
        header = "Probabilities"
        
        directions = [
            
            "Bad Apple = 41.5 %",
            "Orange = 15.4 %",
            "Peach = 13.8 %",
            "Avocado = 12.3 %",
            "trawberry = 7.7 %",
            "Banana = 4.6 %",
            "Apple = 3.1 %",
            "Lemon = 1.5 %",
        ]
        
        directionList.addDirection(header: header, directions: directions)
       
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
