//
//  TicTacToeView.swift
//  TiCTacToe
//
//  Created by sunlubo on 2017/2/10.
//  Copyright © 2017年 slb. All rights reserved.
//

import Foundation

protocol TicTacToeView {
    func showWinner(_ winningPlayerDisplayLabel: String)
    func clearWinnerDisplay()
    func clearButtons()
    func setButtonText(_ row: Int, _ col: Int, _ text: String)
}
