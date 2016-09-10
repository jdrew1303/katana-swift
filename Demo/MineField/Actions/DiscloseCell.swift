//
//  DiscloseCell.swift
//  Katana
//
//  Created by Andrea De Angelis on 07/09/16.
//  Copyright © 2016 Bending Spoons. All rights reserved.
//

import Katana

struct DiscloseCell: SyncSmartAction {
  var payload: (col: Int, raw: Int)
  
  static func reduce(state: inout MineFieldState, action: DiscloseCell) {
    let col = action.payload.col
    let row = action.payload.raw
    var cellsToDisclose = [(col, row)]
    guard !state.gameOver else { return }
    while cellsToDisclose.count > 0 {
      let index = cellsToDisclose.removeFirst()
      if(!state.isDisclosed(col: index.0, row: index.1 )) {
        state.disclose(col: index.0, row: index.1)
        if(state[index.0, index.1]) {
          state.gameOver = true
          return
        }
        if(state.minesNearbyCellAt(col: index.0, row: index.1) == 0) {
          cellsToDisclose.append(contentsOf: state.nearbyCellsIndicesAt(col: index.0, row: index.1))
        }
        
      }
    }
    state.disclose(col: col, row: row)
    
  }
  
}