import SwiftUI

public enum TOFAMonth: Int, CaseIterable, Codable {
    case january = 1
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
}

public enum TOFAMode: String, Codable {
    case day
    case night
}

public struct TOFAShellReference: Codable, Equatable {
    public let paperHex: String
    public let inkHex: String
    public let quietInkHex: String

    public init(paperHex: String, inkHex: String, quietInkHex: String) {
        self.paperHex = paperHex
        self.inkHex = inkHex
        self.quietInkHex = quietInkHex
    }
}

public struct TOFAMonthColors: Codable, Equatable {
    public let monthName: String
    public let attentionName: String
    public let attentionKey: String
    public let topographyHex: String
    public let darkInkHex: String
    public let midInkHex: String
    public let attentionHex: String

    public init(
        monthName: String,
        attentionName: String,
        attentionKey: String,
        topographyHex: String,
        darkInkHex: String,
        midInkHex: String,
        attentionHex: String
    ) {
        self.monthName = monthName
        self.attentionName = attentionName
        self.attentionKey = attentionKey
        self.topographyHex = topographyHex
        self.darkInkHex = darkInkHex
        self.midInkHex = midInkHex
        self.attentionHex = attentionHex
    }
}

public struct TOFAResolvedTheme {
    public let background: Color
    public let primaryText: Color
    public let secondaryText: Color
    public let line: Color
    public let attention: Color

    public init(background: Color, primaryText: Color, secondaryText: Color, line: Color, attention: Color) {
        self.background = background
        self.primaryText = primaryText
        self.secondaryText = secondaryText
        self.line = line
        self.attention = attention
    }
}
