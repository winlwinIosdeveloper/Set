//
//  ViewController.swift
//  Set
//
//  Created by Win Lwin on 05/07/2023.
//

import UIKit

class SetViewController: UIViewController {
	private var touchCount = 0



	@IBOutlet var cardButtons: [UIButton]!
	
	
	
	@IBAction func touchCard(_ sender: UIButton) {
		if touchCount == 3 {
			resetCard()
		}
		if sender.layer.borderWidth == 0 {
			sender.layer.borderWidth = 2.0
			sender.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
			touchCount += 1
		}
		else {
			sender.layer.borderWidth = 0
			touchCount -= 1
		}
		
	}
	
	private func resetCard() {
		for cardButton in cardButtons {
			cardButton.layer.borderWidth = 0
		}
		touchCount = 0
	}
	

}

