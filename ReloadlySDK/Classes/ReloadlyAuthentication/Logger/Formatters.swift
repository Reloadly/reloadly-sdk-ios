//
// Formatters.swift
//

extension Formatters {
    public static let `default` = Formatter("[%@] [Reloadly] %@: %@", [
        .date("yyyy-MM-dd HH:mm:ss.SSS"),
        .level,
        .message
    ])

    public static let minimal = Formatter("%@ %@: %@", [
        .location,
        .level,
        .message
    ])

    public static let detailed = Formatter("[%@] %@.%@:%@ %@: %@", [
        .date("yyyy-MM-dd HH:mm:ss.SSS"),
        .file(fullPath: false, fileExtension: false),
        .function,
        .line,
        .level,
        .message
    ])
}
