import SwiftUI

// MARK: - 共享的基础学习组件

struct ConceptCard: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(.blue)
            
            Text(content)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct CodeExampleCard: View {
    let title: String
    let code: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundColor(.green)
            
            ScrollView(.horizontal, showsIndicators: false) {
                Text(code)
                    .font(.system(.caption, design: .monospaced))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(8)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.green.opacity(0.05))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct TipCard: View {
    let title: String
    let content: String?
    let tips: [String]?
    
    // 支持原有的content参数用法
    init(title: String, content: String) {
        self.title = title
        self.content = content
        self.tips = nil
    }
    
    // 支持新的tips数组用法
    init(title: String, tips: [String]) {
        self.title = title
        self.content = nil
        self.tips = tips
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundColor(.orange)
            
            if let content = content {
                // 原有的content显示方式
                Text(content)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
            } else if let tips = tips {
                // 新的tips数组显示方式
                VStack(alignment: .leading, spacing: 6) {
                    ForEach(tips, id: \.self) { tip in
                        HStack(alignment: .top) {
                            Text("•")
                                .foregroundColor(.orange)
                            Text(tip)
                                .font(.body)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.orange.opacity(0.05))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

// MARK: - 预览
#Preview {
    VStack(spacing: 20) {
        ConceptCard(
            title: "示例概念",
            content: "这是一个概念卡片的示例内容。"
        )
        
        CodeExampleCard(
            title: "代码示例",
            code: """
            let message = "Hello, World!"
            print(message)
            """
        )
        
        TipCard(
            title: "学习要点",
            tips: [
                "这是第一个要点",
                "这是第二个要点",
                "这是第三个要点"
            ]
        )
    }
}