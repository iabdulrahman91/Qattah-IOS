//
//  FormattedTextField.swift
//  Qattah
//
//  Created by abdulrahman alanazi on 3/31/20.
//  Copyright © 2020 abdulrahman alanazi. All rights reserved.
//

import SwiftUI

import SwiftUI

public struct FormattedTextField<Formatter: TextFieldFormatter>: View {
    public init(_ title: String,
                value: Binding<Formatter.Value>,
                formatter: Formatter) {
        self.title = title
        self.value = value
        self.formatter = formatter
    }

    let title: String
    let value: Binding<Formatter.Value>
    let formatter: Formatter

    public var body: some View {
        TextField(title, text: Binding(get: {
            if self.isEditing {
                return self.editingValue
            } else {
                return self.formatter.displayString(for: self.value.wrappedValue)
            }
        }, set: { string in
            self.editingValue = string
            self.value.wrappedValue = self.formatter.value(from: string)
        }), onEditingChanged: { isEditing in
            self.isEditing = isEditing
            self.editingValue = self.formatter.editingString(for: self.value.wrappedValue)
        })
    }

    @State private var isEditing: Bool = false
    @State private var editingValue: String = ""
}

public protocol TextFieldFormatter {
    associatedtype Value
    func displayString(for value: Value) -> String
    func editingString(for value: Value) -> String
    func value(from string: String) -> Value
}

