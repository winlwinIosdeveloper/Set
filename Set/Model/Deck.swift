//
//  Deck.swift
//  Set
//
//  Created by Win Lwin on 06/07/2023.
//

import Foundation

struct Deck {
	var deck = [Card]()
	
	// draw  random card from deck
	mutating func drawRendomCard() -> Card {
		let randomIndex = deck.count.arc4random
		return deck.remove(at: randomIndex)
	}
	
	
	// initialized all the card with specific property
	init() {
		for number in Card.Number.allCases {
			for shape in Card.Shape.allCases {
				for shade in Card.Shade.allCases {
					for color in Card.Color.allCases {
						let card = Card(shape: shape, color: color, number: number, shade: shade)
						deck += [card]
					}
				}
			}
		}
	}
}









extension Int {
	var arc4random: Int {
		if self < 0 {
			return -Int(arc4random_uniform(UInt32(self)))
		} else if self > 0 {
			return Int(arc4random_uniform(UInt32(self)))
		} else {
			return 0
		}
	}

}
