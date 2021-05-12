//
// Formatter.swift
//


import Foundation

public enum Component {
    case date(String)
    case message
    case level
    case file(fullPath: Bool, fileExtension: Bool)
    case line
    case column
    case function
    case location
    case block(() -> Any?)
}

open class Formatters {}

open class Formatter: Formatters {
    /// The formatter format.
    private var format: String

    /// The formatter components.
    private var components: [Component]

    /// The date formatter.
    private let dateFormatter = DateFormatter()

    /// The formatter logger.
    weak var logger: Logger?

    /// The formatter textual representation.
    var description: String {
        return String(format: format, arguments: components.map { (component: Component) -> CVarArg in
            return String(describing: component).uppercased()
        })
    }

//    /**
//     Creates and returns a new formatter with the specified format and components.
//     
//     - parameter format:     The formatter format.
//     - parameter components: The formatter components.
//     
//     - returns: A newly created formatter.
//     */
//    public convenience init(_ format: String, _ components: Component...) {
//        self.init(format, components)
//    }

    /**
     Creates and returns a new formatter with the specified format and components.
     
     - parameter format:     The formatter format.
     - parameter components: The formatter components.
     
     - returns: A newly created formatter.
     */
    public init(_ format: String, _ components: [Component]) {
        self.format = format
        self.components = components
    }

    /**
     Formats a string with the formatter format and components.
     
     - parameter level:      The severity level.
     - parameter items:      The items to format.
     - parameter separator:  The separator between the items.
     - parameter terminator: The terminator of the formatted string.
     - parameter file:       The log file path.
     - parameter line:       The log line number.
     - parameter column:     The log column number.
     - parameter function:   The log function.
     - parameter date:       The log date.
     
     - returns: A formatted string.
     */
    func format(level: Level, items: [Any], separator: String, terminator: String, file: String, line: Int, column: Int, function: String, date: Date) -> String {
        let arguments = components.map { (component: Component) -> CVarArg in
            switch component {
            case let .date(dateFormat):
                return format(date: date, dateFormat: dateFormat)
            case let .file(fullPath, fileExtension):
                return format(file: file, fullPath: fullPath, fileExtension: fileExtension)
            case .function:
                return String(function)
            case .line:
                return String(line)
            case .column:
                return String(column)
            case .level:
                return format(level: level)
            case .message:
                return items.map({ String(describing: $0) }).joined(separator: separator)
            case .location:
                return format(level: level)
            case let .block(block):
                return block().flatMap({ String(describing: $0) }) ?? ""
            }
        }

        return String(format: format, arguments: arguments) + terminator
    }

    /**
     Formats a string with the formatter format and components.
     
     - parameter description:               The measure description.
     - parameter average:                   The average time.
     - parameter relativeStandardDeviation: The relative standard description.
     - parameter file:                      The log file path.
     - parameter line:                      The log line number.
     - parameter column:                    The log column number.
     - parameter function:                  The log function.
     - parameter date:                      The log date.
     
     - returns: A formatted string.
     */
}

private extension Formatter {
    /**
     Formats a date with the specified date format.
     
     - parameter date:       The date.
     - parameter dateFormat: The date format.
     
     - returns: A formatted date.
     */
    func format(date: Date, dateFormat: String) -> String {
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }

    /**
     Formats a file path with the specified parameters.
     
     - parameter file:          The file path.
     - parameter fullPath:      Whether the full path should be included.
     - parameter fileExtension: Whether the file extension should be included.
     
     - returns: A formatted file path.
     */
    func format(file: String, fullPath: Bool, fileExtension: Bool) -> String {
        var file = file

        if !fullPath { file = file.lastPathComponent }
        if !fileExtension { file = file.stringByDeletingPathExtension }

        return file
    }

    /**
     Formats a Level component.
     
     - parameter level: The Level component.
     
     - returns: A formatted Level component.
     */
    func format(level: Level) -> String {
        let text = level.description
        return text
    }
}

extension String {
    /// The last path component of the receiver.
    var lastPathComponent: String {
        return NSString(string: self).lastPathComponent
    }

    /// A new string made by deleting the extension from the receiver.
    var stringByDeletingPathExtension: String {
        return NSString(string: self).deletingPathExtension
    }
}
