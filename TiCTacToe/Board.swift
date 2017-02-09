//
//  Board.swift
//  TiCTacToe
//
//  Created by sunlubo on 2017/2/9.
//  Copyright © 2017年 slb. All rights reserved.
//

import Foundation

final class Board {
    
    enum GameState {
        case inProgress
        case finished
    }
    
    var cells = Array(repeating: Array(repeating: Cell(), count: 3), count: 3)
    var winner: Player!
    var currentTurn: Player!
    var state: GameState!
    
    init() {
        restart()
    }
    
    /// Restart or start a new game, will clear the board and win status.
    func restart() {
        clearCells()
        winner = nil
        currentTurn = .x
        state = .inProgress
    }
    
    /// Mark the current row for the player who's current turn it is.
    /// Will perform no-op if the arguments are out of range or if that position is already played.
    /// Will also perform a no-op if the game is already over.
    ///
    /// - Parameters:
    ///   - row: 0..2
    ///   - col: 0..2
    /// - Returns: the player that moved or nil if we did not move anything.
    func mark(row: Int, col: Int) -> Player? {
        guard isValid(row, col) else { return nil }
        
        let playerThatMoved = currentTurn
        
        cells[row][col].value = playerThatMoved
        
        if isWinningMoveByPlayer(currentTurn, row, col) {
            state = .finished
            winner = currentTurn
        } else {
            // flip the current turn and continue
            flipCurrentTurn()
        }
        
        return playerThatMoved
    }
    
    private func clearCells() {
        for i in 0..<3 {
            for j in 0..<3 {
                cells[i][j].value = nil
            }
        }
    }
    
    private func isValid(_ row: Int, _ col: Int) -> Bool {
        guard state != .finished else { return false }
        
        if isOutOfBounds(row) || isOutOfBounds(row) {
            return false
        } else if isCellValueAlreadySet(row, col) {
            return false
        }
        
        return true
    }
    
    private func isOutOfBounds(_ idx: Int) -> Bool {
        return idx < 0 || idx > 2
    }
    
    private func isCellValueAlreadySet(_ row: Int, _ col: Int) -> Bool {
        return cells[row][col].value != nil
    }
    
    /// Algorithm adapted from http://www.ntu.edu.sg/home/ehchua/programming/java/JavaGame_TicTacToe.html
    ///
    /// - Parameters:
    ///   - player: player
    ///   - currentRow: currentRow
    ///   - currentCol: currentCol
    /// - Returns: true if `player` who just played the move at the `currentRow`, `currentCol` has a tic tac toe.
    private func isWinningMoveByPlayer(_ player: Player, _ currentRow: Int, _ currentCol: Int) -> Bool {
        return (cells[currentRow][0].value == player // 3-in-the-row
            && cells[currentRow][1].value == player
            && cells[currentRow][2].value == player
            || cells[0][currentCol].value == player // 3-in-the-column
            && cells[1][currentCol].value == player
            && cells[2][currentCol].value == player
            || currentRow == currentCol // 3-in-the-diagonal
            && cells[0][0].value == player
            && cells[1][1].value == player
            && cells[2][2].value == player
            || currentRow + currentCol == 2 // 3-in-the-opposite-diagonal
            && cells[0][2].value == player
            && cells[1][1].value == player
            && cells[2][0].value == player)
    }
    
    private func flipCurrentTurn() {
        currentTurn = currentTurn == .x ? .o : .x
    }
}
