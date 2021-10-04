//
//  ContentView.swift
//  edutainment
//
//  Created by Ifang Lee on 10/3/21.
//
// https://www.hackingwithswift.com/guide/ios-swiftui/3/3/challenge
//
// The player needs to select which multiplication tables they want to practice.
// This could be pressing buttons, or it could be an “Up to…” stepper, going from 1 to 12.
// The player should be able to select how many questions they want to be asked: 5, 10, 20, or “All”.
// You should randomly generate as many questions as they asked for, within the difficulty range they asked for.
// For the “all” case you should generate all possible combinations.
//
//At the very least, you should:
//
//Start with a Single View App template, then add some state to determine whether the game is active or whether you’re asking for settings.
//Because the app has two very different states – “we’re asking the user for settings” and “the game is running” – you should use a Group as your top-level view, so that some View always gets the same view type being sent back.
//Try and break up your layouts into new SwiftUI views, rather than putting everything in ContentView.
//Show the player how many questions they got correct at the end of the game, then offer to let them play again.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
