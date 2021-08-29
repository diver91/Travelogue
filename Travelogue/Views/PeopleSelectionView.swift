//
//  PeopleSelectionView.swift
//  PeopleSelectionView
//
//  Created by Patrick Goudeau on 8/22/21.
//

import SwiftUI

//MARK: - Example 1
struct Ocean: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

struct PeopleSelectionView: View {
    @State private var isEditMode: EditMode = .active

    private var oceans = [
        Ocean(name: "Pacific"),
        Ocean(name: "Atlantic"),
        Ocean(name: "Indian"),
        Ocean(name: "Southern"),
        Ocean(name: "Arctic")
    ]
    // For just selecting by the id
    @State private var multiSelection = Set<UUID>()
    // For selecting the actual objects
    @State private var selectedCategories = Set<Ocean>()

    var body: some View {
        NavigationView {
            VStack {
                List(oceans, id: \.self,  selection: $selectedCategories) {
                        Text($0.name)
                    }.environment(\.editMode, self.$isEditMode)
                    .navigationTitle("Oceans")
                .toolbar { EditButton() }

                Text("\(selectedCategories.count) selections")
                //Text(selectedCategories.first!.name)
            }
        }

    }
}

//MARK: - Example 2
//struct PeopleSelectionView: View {
//    struct Sea: Hashable, Identifiable {
//        let name: String
//        let id = UUID()
//    }
//    struct OceanRegion: Identifiable {
//        let name: String
//        let seas: [Sea]
//        let id = UUID()
//    }
//    private let oceanRegions: [OceanRegion]  = [
//        OceanRegion(name: "Pacific",
//                    seas: [Sea(name: "Australasian Mediterranean"),
//                           Sea(name: "Philippine"),
//                           Sea(name: "Coral"),
//                           Sea(name: "South China")]),
//        OceanRegion(name: "Atlantic",
//                    seas: [Sea(name: "American Mediterranean"),
//                           Sea(name: "Sargasso"),
//                           Sea(name: "Caribbean")]),
//        OceanRegion(name: "Indian",
//                    seas: [Sea(name: "Bay of Bengal")]),
//        OceanRegion(name: "Southern",
//                    seas: [Sea(name:"Weddell")]),
//        OceanRegion(name: "Arctic",
//                    seas: [Sea(name: "Greenland")])
//    ]
//    @State private var singleSelection : UUID?
//
//    var body: some View {
//        NavigationView {
//            List(selection: $singleSelection){
//                ForEach(oceanRegions) { region in
//                    Section(header: Text("Major \(region.name) Ocean Seas")) {
//                        ForEach(region.seas) { sea in
//                            Text(sea.name)
//                        }
//                    }
//                }.listStyle(InsetGroupedListStyle())
//            }
//            .navigationTitle("Oceans and Seas")
//            .toolbar { EditButton() }
//        }
//    }
//}

//MARK: - Example 3
//struct PeopleSelectionView: View {
//    @State var items: [String] = ["Apples", "Oranges", "Bananas", "Pears", "Mangos", "Grapefruit"]
//    @State var selections: [String] = []
//
//    var body: some View {
//        List {
//            ForEach(self.items, id: \.self) { item in
//                MultipleSelectionRow(title: item, isSelected: self.selections.contains(item)) {
//                    if self.selections.contains(item) {
//                        self.selections.removeAll(where: { $0 == item })
//                    }
//                    else {
//                        self.selections.append(item)
//                    }
//                }
//            }
//        }
//    }
//}
//struct MultipleSelectionRow: View {
//    var title: String
//    var isSelected: Bool
//    var action: () -> Void
//
//    var body: some View {
//        Button(action: self.action) {
//            HStack {
//                Text(self.title)
//                    .foregroundColor(.black)
//                if self.isSelected {
//                    Spacer()
//                    Image(systemName: "checkmark")
//                        .foregroundColor(.black)
//                }
//            }
//        }
//    }
//}

//MARK: - Example 4
//enum Fruit: String, CaseIterable, Hashable {
//    case apple = "Apple"
//    case orange = "Orange"
//    case banana = "Banana"
//}
//
//struct PeopleSelectionView: View {
//
//    @State var fruits = [Bool](repeating: false, count: Fruit.allCases.count)
//
//    var body: some View {
//        Form{
//            ForEach(0..<fruits.count, id:\.self){i in
//                Toggle(isOn: self.$fruits[i]){
//                    Text(Fruit.allCases[i].rawValue)
//                }.toggleStyle(CheckmarkToggleStyle())
//            }
//        }
//    }
//}
//
//struct CheckmarkToggleStyle: ToggleStyle {
//    func makeBody(configuration: Self.Configuration) -> some View {
//        HStack {
//            Button(action: { withAnimation { configuration.$isOn.wrappedValue.toggle() }}){
//                HStack{
//                    configuration.label.foregroundColor(.primary)
//                    Spacer()
//                    if configuration.isOn {
//                        Image(systemName: "checkmark").foregroundColor(.primary)
//                    }
//                }
//            }
//        }
//    }
//}

//MARK: - Example 5
//struct Fruit: Selectable {
//    let name: String
//    var isSelected: Bool
//    var id: String { name }
//}
//
//struct PeopleSelectionView: View {
//
//    @State var fruits = [
//        Fruit(name: "Apple", isSelected: true),
//        Fruit(name: "Banana", isSelected: false),
//        Fruit(name: "Kumquat", isSelected: true),
//    ]
//
//    var body: some View {
//        VStack {
//            Text("Number selected: \(fruits.filter { $0.isSelected }.count)")
//            Multiselect(items: $fruits) { fruit in
//                HStack {
//                    Text(fruit.name)
//                    Spacer()
//                    if fruit.isSelected {
//                        Image(systemName: "checkmark")
//                    }
//                }
//            }
//
//        }
//    }
//}
//protocol Selectable: Identifiable {
//    var name: String { get }
//    var isSelected: Bool { get set }
//}
//
//struct Multiselect<T: Selectable, V: View>: View {
//    @Binding var items: [T]
//    var rowBuilder: (T) -> V
//
//    var body: some View {
//        List(items) { item in
//            Button(action: { self.items.toggleSelected(item) }) {
//                self.rowBuilder(item)
//            }
//        }
//    }
//}
//
//extension Array where Element: Selectable {
//    mutating func toggleSelected(_ item: Element) {
//        if let index = firstIndex(where: { $0.id == item.id }) {
//            var mutable = item
//            mutable.isSelected.toggle()
//            self[index] = mutable
//        }
//    }
//}

//MARK: - Example 6
//struct PeopleSelectionView: View {
//    @State var items = ["Pizza", "Spaghetti", "Caviar"]
//    @State var selection = Set<String>()
//
//    var body: some View {
//        List(items, id: \.self, selection: $selection) { (item : String) in
//
//            let s = selection.contains(item) ? "√" : " "
//
//            HStack {
//                Text(s+item)
//                Spacer()
//            }
//            .contentShape(Rectangle())
//            .onTapGesture {
//                if  selection.contains(item) {
//                    selection.remove(item)
//                }
//                else{
//                    selection.insert(item)
//                }
//                print(selection)
//            }
//        }
//        .listStyle(GroupedListStyle())
//    }
//}


struct PeopleSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleSelectionView()
    }
}
