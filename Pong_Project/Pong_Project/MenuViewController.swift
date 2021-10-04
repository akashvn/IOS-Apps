//
//  MenuViewController.swift
//  Pong_Project
//
//  Created by Akash Vemulapalli on 3/6/19.
//  Copyright © 2019 Vemulapalli. All rights reserved.
//

import Foundation
import UIKit


enum gameType
{
    case easy
    case medium
    case hard
    case player2
    
}

class MenuViewController : UIViewController {
    
    @IBAction func Player2(_ sender: Any)
    {
        moveToGame(game: .player2)
    }
    
    @IBAction func Easy(_ sender: Any)
    {
        moveToGame(game: .easy)

    }
    
    @IBAction func Medium(_ sender: Any)
    {
        moveToGame(game: .medium)

    }
    
    @IBAction func Hard(_ sender: Any)
    {
        moveToGame(game: .hard)

    }
    
    func moveToGame(game:gameType)
    {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType=game
        
        self.navigationController?.pushViewController(gameVC, animated: true)
        
        
    }
    
}
