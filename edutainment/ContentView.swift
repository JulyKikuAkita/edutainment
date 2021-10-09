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

//naturalization test  2008
enum category: String {
    case democracy = "Principles of American Democracy" //1-12
    case system = "System of Government" //13-47
    case rights = "Rights and Responsibilities" //48 -57
    case history = "AMERICAN HISTORY" // 58-87
    case geo = "Geography" // 88-95
    case symbols = "Symbols" //96-98
    case holidays = "Holidays" // 99-100
}

struct Question {
    let title: String
    let answer: String
    let number: Int
    let type: category
}


struct Questions {
    static let items: [Question] = [
        Question(title: "What is the supreme law of the land?", answer: "the Constitution", number: 1, type: .democracy),
        Question(title: "What does the Constitution do?", answer: "defines the government/protects basic rights of Americans", number: 2, type: .democracy),
        Question(title: "What is one right or freedom from the First Amendment?", answer: "speech,religion,assembly,press,petition the government", number: 6, type: .democracy),
        Question(title: "How many amendments does the Constitution have?", answer: "27", number: 7, type: .democracy),
        Question(title: "What are two rights in the Declaration of Independence?", answer: "life,liberty,pursuit of happiness", number: 9, type: .democracy),
        Question(title: "Name one branch or part of the government.", answer: "Congress,legislative,President,executive,the courts,judicial", number: 13, type: .system),
        Question(title: "Who makes federal laws?", answer: "Congress", number: 16, type: .system),
        Question(title: "Who is one of your state’s U.S. Senators now?*", answer: "Dianne Feinstein", number: 20, type: .system),
        Question(title: "The House of Representatives has how many voting members?", answer: "435", number: 21, type: .system),
        Question(title: "Name your U.S. Representative.", answer: "Nancy Pelosi", number: 23, type: .system),
        Question(title: "What is the name of the Vice President of the United States now?", answer: "Kamala Harris", number: 29, type: .system),
        Question(title: "What are two Cabinet-level positions?", answer: "Vice President,Attorney General,Secretary of Agriculture,Commerce,Defense,Education,Energy,Health and Human Services,Homeland Security,Housing and Urban Development,the Interior,Labor,State,Transportation,Treasury,Veterans Affairs", number: 65, type: .system),
        Question(title: "What does the judicial branch do?", answer: "reviews laws,explains laws,resolves disputes (disagreements),decides if a law goes against the Constitution", number: 37, type: .system),
        Question(title: "Who is the Chief Justice of the United States now?", answer: "John Roberts", number: 40, type: .system),
        Question(title: "Under our Constitution, some powers belong to the federal government. What is one power of the federal government?", answer: "to print money,to declare war,to create an army,to make treaties", number: 41, type: .system),
        Question(title: "Under our Constitution, some powers belong to the states. What is one power of the states?", answer: "provide schooling and education,provide protection (police),provide safety (fire departments),give a driver’s license,approve zoning and land use", number: 42, type: .system),
        Question(title: "Who is the Governor of your state now?", answer: "Gavin Newsom", number: 43, type: .system),
        Question(title: "There are four amendments to the Constitution about who can vote. Describe one of them.", answer: "Citizens eighteen (18) and older (can vote).You don’t have to pay (a poll tax) to vote.Any citizen can vote. (Women and men can vote.) A male citizen of any race (can vote).", number: 48, type: .rights),
        Question(title: "What is one responsibility that is only for United States citizens?", answer: "serve on a jury,vote in a federal election", number: 49, type: .rights),
        Question(title: "What are two rights of everyone living in the United States?", answer: "freedom of expression,speech,assembly,religion,freedom to petition the government,the right to bear arms", number: 51, type: .rights),
        Question(title: "When must all men register for the Selective Service?", answer: "at age eighteen (18),between eighteen (18) and twenty-six (26)", number: 57, type: .rights),
        Question(title: "What is one reason colonists came to America?", answer: "freedom,political liberty,religious freedom,economic opportunity,practice their religion,escape persecution", number: 66, type: .history),
        Question(title: "Who wrote the Declaration of Independence?", answer: "(Thomas) Jefferson", number: 62, type: .history),
        Question(title: "When was the Declaration of Independence adopted?", answer: "July 4, 1776", number: 63, type: .history),
        Question(title: "There were 13 original states. Name three.", answer: "New Hampshire,Massachusetts,Rhode Island,Connecticut,New York,New Jersey,Pennsylvania,Delaware,Maryland,Virginia,North Carolina,South Carolina,Georgia", number: 64, type: .history),
        Question(title: "What happened at the Constitutional Convention?", answer: "The Constitution was written.", number: 65, type: .history),
        Question(title: "When was the Constitution written?", answer: "1787", number: 66, type: .history),
        Question(title: "The Federalist Papers supported the passage of the U.S. Constitution. Name one of the writers.", answer: "(James) Madison,(Alexander) Hamilton,(John) Jay,Publius", number: 67, type: .history),
        Question(title: "What did the Emancipation Proclamation do?", answer: "freed the slaves", number: 76, type: .history),
        Question(title: "What did Susan B. Anthony do?", answer: "fought for women’s rights", number: 77, type: .history),
        Question(title: "Who was President during World War I?", answer: "(Woodrow) Wilson", number: 79, type: .history),
        Question(title: "Who was President during the Great Depression and World War II?", answer: "(Franklin) Roosevelt", number: 80, type: .history),
        Question(title: "Name one American Indian tribe in the United States.?", answer: "Cherokee,Navajo,Sioux,Chippewa,Choctaw,Pueblo,Apache,Iroquois,Creekm,Blackfeet,Seminole,Cheyenne,Arawak,Shawnee,Mohegan,Huron,Oneida,Lakota,Crow,Teton,Hopi,Inuit", number: 87, type: .history),
        Question(title: "Name one U.S. territory?", answer: "Puerto Rico,U.S. Virgin Islands,American Samoa,Northern Mariana Islands,Guam", number: 91, type: .geo),
        Question(title: "What is the name of the national anthem?", answer: "The Star-Spangled Banner", number: 98, type: .symbols)
    ]
}
struct ContentView: View {
    @State private var numberOfQuestions = 10.0
    @State private var showAnswer = false

    let maxCount = Questions.items.count
    var questionSet:[Question] {
        if numberOfQuestions == 10.0 {
            return generateQuestions(10)
        } else {
            return generateQuestions(12)
        }
    }

    var body: some View {
            VStack {
                Slider(value: $numberOfQuestions, in: 10...Double(maxCount))
                Text("You choose \(numberOfQuestions, specifier: "%.2g") questions")
                List(questionSet, id: \.self.title) { question in
                    Text(question.title)
                        .padding()
                    if showAnswer {
                        Text(question.answer)
                            .frame(width: .infinity, height: .infinity)
                            .foregroundColor(.pink)
                            .background(Color.blue)
                            .transition(.slide)
                    }
                }
                Button("Show Anwer?") {
                    showAnswer.toggle()
                }
            }
    }
}

func generateQuestions(_ total: Int) -> [Question]  {
    return Array(Questions.items.shuffled().prefix(through: total))
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
