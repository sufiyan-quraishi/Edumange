<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Chatbot Isolated Layout & Component Styles -->
<style>
    #chatbotBubble {
        position: fixed !important;
        bottom: 24px !important;
        right: 24px !important;
        width: 58px !important;
        height: 58px !important;
        border-radius: 50% !important;
        background: linear-gradient(135deg, #4f6ef7, #3b82f6) !important;
        color: #ffffff !important;
        border: none !important;
        outline: none !important;
        cursor: pointer !important;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        box-shadow: 0 10px 28px rgba(79, 110, 247, 0.45) !important;
        z-index: 999999 !important;
        pointer-events: auto !important;
        transition: transform 0.25s ease, box-shadow 0.25s ease !important;
    }

    #chatbotBubble:hover {
        transform: scale(1.08) !important;
        box-shadow: 0 14px 34px rgba(79, 110, 247, 0.6) !important;
    }

    #chatbotPanel {
        position: fixed !important;
        bottom: 96px !important;
        right: 24px !important;
        width: 370px !important;
        max-width: calc(100vw - 40px) !important;
        height: 500px !important;
        max-height: calc(100vh - 120px) !important;
        background: #ffffff !important;
        border: 1px solid #e2e8f0 !important;
        border-radius: 22px !important;
        box-shadow: 0 20px 50px rgba(15, 23, 42, 0.25) !important;
        display: none;
        flex-direction: column !important;
        overflow: hidden !important;
        z-index: 999999 !important;
        font-family: inherit !important;
    }

    [data-theme="dark"] #chatbotPanel {
        background: #111827 !important;
        border-color: #1f293d !important;
        color: #f8fafc !important;
    }

    .chatbot-header {
        background: linear-gradient(135deg, #4f6ef7, #3b82f6) !important;
        color: #ffffff !important;
        padding: 14px 18px !important;
        display: flex !important;
        align-items: center !important;
        justify-content: space-between !important;
        flex-shrink: 0 !important;
    }

    .chatbot-header-info {
        display: flex !important;
        align-items: center !important;
        gap: 12px !important;
    }

    .bot-avatar {
        width: 36px !important;
        height: 36px !important;
        border-radius: 50% !important;
        background: rgba(255, 255, 255, 0.2) !important;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
    }

    .bot-title-area h4 {
        margin: 0 !important;
        font-size: 14.5px !important;
        font-weight: 700 !important;
        color: #ffffff !important;
    }

    .bot-title-area .sub {
        font-size: 11px !important;
        opacity: 0.9 !important;
        color: #ffffff !important;
        display: flex !important;
        align-items: center !important;
        gap: 5px !important;
    }

    .online-dot {
        width: 7px !important;
        height: 7px !important;
        border-radius: 50% !important;
        background: #10b981 !important;
        display: inline-block !important;
    }

    #chatbotClose {
        background: transparent !important;
        border: none !important;
        color: #ffffff !important;
        font-size: 24px !important;
        cursor: pointer !important;
        line-height: 1 !important;
    }

    #chatbotMessages {
        flex: 1 !important;
        padding: 16px !important;
        overflow-y: auto !important;
        display: flex !important;
        flex-direction: column !important;
        gap: 12px !important;
    }

    .chat-msg {
        max-width: 82% !important;
        padding: 10px 14px !important;
        border-radius: 14px !important;
        font-size: 13.5px !important;
        line-height: 1.5 !important;
        word-break: break-word !important;
    }

    .chat-msg.bot {
        background: #f1f5f9 !important;
        color: #0f172a !important;
        align-self: flex-start !important;
        border-bottom-left-radius: 4px !important;
    }

    [data-theme="dark"] .chat-msg.bot {
        background: #1e293b !important;
        color: #f8fafc !important;
    }

    .chat-msg.user {
        background: #4f6ef7 !important;
        color: #ffffff !important;
        align-self: flex-end !important;
        border-bottom-right-radius: 4px !important;
    }

    #chatbotQuick {
        display: flex !important;
        gap: 6px !important;
        padding: 8px 12px !important;
        overflow-x: auto !important;
        border-top: 1px solid #e2e8f0 !important;
        background: rgba(0,0,0,0.02) !important;
        flex-shrink: 0 !important;
    }

    [data-theme="dark"] #chatbotQuick {
        border-color: #1f293d !important;
        background: rgba(255,255,255,0.02) !important;
    }

    .quick-chip {
        background: #ffffff !important;
        border: 1px solid #cbd5e1 !important;
        border-radius: 20px !important;
        padding: 5px 12px !important;
        font-size: 11.5px !important;
        font-weight: 600 !important;
        color: #334155 !important;
        cursor: pointer !important;
        white-space: nowrap !important;
    }

    [data-theme="dark"] .quick-chip {
        background: #1e293b !important;
        border-color: #334155 !important;
        color: #cbd5e1 !important;
    }

    .chatbot-input {
        display: flex !important;
        padding: 12px !important;
        gap: 8px !important;
        border-top: 1px solid #e2e8f0 !important;
        background: #ffffff !important;
        flex-shrink: 0 !important;
    }

    [data-theme="dark"] .chatbot-input {
        background: #111827 !important;
        border-color: #1f293d !important;
    }

    #chatbotInput {
        flex: 1 !important;
        border: 1px solid #cbd5e1 !important;
        border-radius: 10px !important;
        padding: 10px 14px !important;
        font-size: 13.5px !important;
        outline: none !important;
        background: transparent !important;
        color: inherit !important;
    }

    #chatbotSend {
        background: #4f6ef7 !important;
        color: #ffffff !important;
        border: none !important;
        border-radius: 10px !important;
        width: 40px !important;
        height: 40px !important;
        cursor: pointer !important;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
    }
</style>

<!-- Floating Chatbot Launcher Button -->
<button id="chatbotBubble" class="chatbot-bubble" title="Chat with EduManage Assistant" aria-label="Open Chat" type="button">
    <i class="fas fa-comment-dots" style="font-size: 24px;"></i>
</button>

<!-- Chatbot Popup Panel -->
<div id="chatbotPanel" class="chatbot-panel">
    <!-- Header -->
    <div class="chatbot-header">
        <div class="chatbot-header-info">
            <div class="bot-avatar">
                <i class="fas fa-robot" style="font-size: 18px; color: #ffffff;"></i>
            </div>
            <div class="bot-title-area">
                <h4>EduManage Assistant</h4>
                <span class="sub"><span class="online-dot"></span> Online &bull; Admissions & Courses</span>
            </div>
        </div>
        <button id="chatbotClose" class="chatbot-close" type="button" aria-label="Close Chat">&times;</button>
    </div>

    <!-- Messages Container -->
    <div id="chatbotMessages" class="chatbot-messages">
        <div class="chat-msg bot">
            Hello! I'm the EduManage Assistant. How can I help you with courses, fees, or admissions today?
        </div>
    </div>

    <!-- Quick Action Chips -->
    <div id="chatbotQuick" class="chatbot-quick"></div>

    <!-- Input Box -->
    <div class="chatbot-input">
        <input id="chatbotInput" type="text" placeholder="Type your message..." autocomplete="off">
        <button id="chatbotSend" type="button" aria-label="Send">
            <i class="fas fa-paper-plane" style="font-size: 15px;"></i>
        </button>
    </div>
</div>

<!-- Scripts (Context-safe JS imports) -->
<script src="${pageContext.request.contextPath}/js/theme.js"></script>
<script src="${pageContext.request.contextPath}/js/chatbot.js"></script>