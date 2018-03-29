//
//  MovieQuotes.swift
//  MovieQuotes
//
//  Created by Yuan zhou on 3/29/18.
//  Copyright © 2018 Yuan zhou. All rights reserved.
//

import UIKit

class MovieQuotes: NSObject {
    var quote: String
    var movie: String
    init(quote: String, movie: String) {
        self.quote = quote
        self.movie = movie
    }
}
