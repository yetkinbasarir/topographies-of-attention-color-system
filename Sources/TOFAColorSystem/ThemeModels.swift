import SwiftUI
import Foundation

public enum TOFAMonth: Int, CaseIterable, Codable, Sendable {
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

    public var displayName: String {
        switch self {
        case .january: return "January"
        case .february: return "February"
        case .march: return "March"
        case .april: return "April"
        case .may: return "May"
        case .june: return "June"
        case .july: return "July"
        case .august: return "August"
        case .september: return "September"
        case .october: return "October"
        case .november: return "November"
        case .december: return "December"
        }
    }

    public static func from(date: Date, calendar: Calendar = .current) -> TOFAMonth {
        let monthValue = calendar.component(.month, from: date)
        return TOFAMonth(rawValue: monthValue) ?? .january
    }
}

public enum TOFAPhase: String, CaseIterable, Codable, Sendable {
    case day
    case night
}

public enum TOFAThemeCode: String, CaseIterable, Codable, Sendable {
    case shellDay
    case shellNight
    case januaryDay
    case februaryDay
    case marchDay
    case aprilDay
    case mayDay
    case juneDay
    case julyDay
    case augustDay
    case septemberDay
    case octoberDay
    case novemberDay
    case decemberDay
    case januaryNight
    case februaryNight
    case marchNight
    case aprilNight
    case mayNight
    case juneNight
    case julyNight
    case augustNight
    case septemberNight
    case octoberNight
    case novemberNight
    case decemberNight

    public var month: TOFAMonth? {
        switch self {
        case .januaryDay, .januaryNight: return .january
        case .februaryDay, .februaryNight: return .february
        case .marchDay, .marchNight: return .march
        case .aprilDay, .aprilNight: return .april
        case .mayDay, .mayNight: return .may
        case .juneDay, .juneNight: return .june
        case .julyDay, .julyNight: return .july
        case .augustDay, .augustNight: return .august
        case .septemberDay, .septemberNight: return .september
        case .octoberDay, .octoberNight: return .october
        case .novemberDay, .novemberNight: return .november
        case .decemberDay, .decemberNight: return .december
        case .shellDay, .shellNight: return nil
        }
    }

    public var phase: TOFAPhase {
        switch self {
        case .shellDay, .januaryDay, .februaryDay, .marchDay, .aprilDay, .mayDay, .juneDay, .julyDay, .augustDay, .septemberDay, .octoberDay, .novemberDay, .decemberDay:
            return .day
        case .shellNight, .januaryNight, .februaryNight, .marchNight, .aprilNight, .mayNight, .juneNight, .julyNight, .augustNight, .septemberNight, .octoberNight, .novemberNight, .decemberNight:
            return .night
        }
    }

    public var isShell: Bool {
        switch self {
        case .shellDay, .shellNight: return true
        default: return false
        }
    }
}

public struct TOFAShellReference: Codable, Equatable, Sendable {
    public let paperHex: String
    public let inkHex: String
    public let quietInkHex: String

    public init(paperHex: String, inkHex: String, quietInkHex: String) {
        self.paperHex = paperHex
        self.inkHex = inkHex
        self.quietInkHex = quietInkHex
    }
}

public struct TOFAMonthColors: Codable, Equatable, Sendable {
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

public struct TOFAResolvedTheme: Equatable, Sendable {
    public let code: TOFAThemeCode
    public let displayName: String
    public let phase: TOFAPhase
    public let month: TOFAMonth?
    public let backgroundHex: String
    public let primaryTextHex: String
    public let secondaryTextHex: String
    public let lineHex: String
    public let attentionHex: String?

    public init(
        code: TOFAThemeCode,
        displayName: String,
        phase: TOFAPhase,
        month: TOFAMonth?,
        backgroundHex: String,
        primaryTextHex: String,
        secondaryTextHex: String,
        lineHex: String,
        attentionHex: String?
    ) {
        self.code = code
        self.displayName = displayName
        self.phase = phase
        self.month = month
        self.backgroundHex = backgroundHex
        self.primaryTextHex = primaryTextHex
        self.secondaryTextHex = secondaryTextHex
        self.lineHex = lineHex
        self.attentionHex = attentionHex
    }

    public var background: Color { Color(hex: backgroundHex) }
    public var primaryText: Color { Color(hex: primaryTextHex) }
    public var secondaryText: Color { Color(hex: secondaryTextHex) }
    public var line: Color { Color(hex: lineHex) }
    public var attention: Color? { attentionHex.map(Color.init(hex:)) }
}

public struct TOFAThemeBundle: Equatable, Sendable {
    public let shell: TOFAResolvedTheme
    public let monthly: TOFAResolvedTheme

    public init(shell: TOFAResolvedTheme, monthly: TOFAResolvedTheme) {
        self.shell = shell
        self.monthly = monthly
    }
}
