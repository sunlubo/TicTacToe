//
//  TicTacToeViewController.swift
//  TiCTacToe
//
//  Created by sunlubo on 2017/2/9.
//  Copyright © 2017年 slb. All rights reserved.
//

import UIKit

final class TicTacToeViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var winnerPlayerView: UIView!
    @IBOutlet weak var winnerPlayerLabel: UILabel!
    
    var cellButtons = [UIButton]()
    
    var model = Board()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellButtons.append(contentsOf: [button1, button2, button3, button4, button5, button6, button7, button8, button9])
        
        resetButtonClicked()
    }
    
    // When the view tells us a cell is clicked in the tic tac toe board, this method will fire.
    // We update the model and then interrogate it's state to decide how to proceed.
    // If X or O won with this move, update the view to display this and otherwise mark the cell that was clicked.
    @IBAction func cellsClicked(button: UIButton) {
        let tag = button.tag.description
        let row = Int(tag.substring(to: tag.index(tag.startIndex, offsetBy: 1)))! - 1
        let col = Int(tag.substring(with: tag.index(tag.startIndex, offsetBy: 1)..<tag.endIndex))! - 1
        
        if let player = model.mark(row: row, col: col) {
            button.setTitle(player.rawValue, for: .normal)
            
            if model.winner != nil {
                winnerPlayerLabel.text = player.rawValue
                winnerPlayerView.isHidden = false
            }
        }
    }
    
    // On reset, we clear the winner label and hide it, then clear out each button. We also tell the model to reset (restart) it's state.
    @IBAction func resetButtonClicked() {
        model.restart()
        
        cellButtons.forEach({ $0.setTitle(nil, for: .normal) })
        
        winnerPlayerLabel.text = nil
        winnerPlayerView.isHidden = true
    }
}
