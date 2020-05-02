//
//  MoviePage.swift
//  ExampleMVVM
//
//  Created by Scott Leonard on 4/21/20.
//

import Foundation

struct MoviesPage: Equatable {
	let page: Int
	let totalPages: Int
	let movies: [Movie]
}
