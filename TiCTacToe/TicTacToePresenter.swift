//
//  TicTacToePresenter.swift
//  TiCTacToe
//
//  Created by sunlubo on 2017/2/10.
//  Copyright © 2017年 slb. All rights reserved.
//

import Foundation

final class TicTacToePresenter: Presenter {
    let view: TicTacToeView
    let model: Board
    
    init(view: TicTacToeView) {
        self.view = view
        self.model = Board()
    }
    
    // When the view tells us a cell is clicked in the tic tac toe board, this method will fire.
    // We update the model and then interrogate it's state to decide how to proceed.
    // If X or O won with this move, update the view to display this and otherwise mark the cell that was clicked.
    func cellsClicked(row: Int, col: Int) {
        if let player = model.mark(row: row, col: col) {
            view.setButtonText(row, col, player.rawValue)
            
            if model.winner != nil {
                view.showWinner(player.rawValue)
            }
        }
    }
    
    // On reset, we clear the winner label and hide it, then clear out each button. We also tell the model to reset (restart) it's state.
    func resetButtonClicked() {
        model.restart()
        
        view.clearWinnerDisplay()
        view.clearButtons()
    }
}
