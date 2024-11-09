.class public Lcom/getkeepsafe/relinker/ApkLibraryInstaller;
.super Ljava/lang/Object;
.source "ApkLibraryInstaller.java"

# interfaces
.implements Lcom/getkeepsafe/relinker/ReLinker$LibraryInstaller;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;
    }
.end annotation


# static fields
.field private static final COPY_BUFFER_SIZE:I = 0x1000

.field private static final MAX_TRIES:I = 0x5


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private closeSilently(Ljava/io/Closeable;)V
    .locals 1
    .param p1, "closeable"    # Ljava/io/Closeable;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "closeable"
        }
    .end annotation

    .line 258
    if-eqz p1, :cond_0

    .line 259
    :try_start_0
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 261
    :catch_0
    move-exception v0

    :cond_0
    :goto_0
    nop

    .line 262
    return-void
.end method

.method private copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .locals 6
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "in",
            "out"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 238
    const-wide/16 v0, 0x0

    .line 239
    .local v0, "copied":J
    const/16 v2, 0x1000

    new-array v2, v2, [B

    .line 241
    .local v2, "buf":[B
    :goto_0
    invoke-virtual {p1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 242
    .local v3, "read":I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    .line 243
    nop

    .line 248
    .end local v3    # "read":I
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V

    .line 249
    return-wide v0

    .line 245
    .restart local v3    # "read":I
    :cond_0
    const/4 v4, 0x0

    invoke-virtual {p2, v2, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 246
    int-to-long v4, v3

    add-long/2addr v0, v4

    .line 247
    .end local v3    # "read":I
    goto :goto_0
.end method

.method private findAPKWithLibrary(Landroid/content/Context;[Ljava/lang/String;Ljava/lang/String;Lcom/getkeepsafe/relinker/ReLinkerInstance;)Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;
    .locals 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "abis"    # [Ljava/lang/String;
    .param p3, "mappedLibraryName"    # Ljava/lang/String;
    .param p4, "instance"    # Lcom/getkeepsafe/relinker/ReLinkerInstance;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10,
            0x10,
            0x10
        }
        names = {
            "context",
            "abis",
            "mappedLibraryName",
            "instance"
        }
    .end annotation

    .line 72
    move-object/from16 v1, p2

    invoke-direct/range {p0 .. p1}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->sourceDirectories(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_5

    aget-object v6, v2, v5

    .line 73
    .local v6, "sourceDir":Ljava/lang/String;
    const/4 v7, 0x0

    .line 74
    .local v7, "zipFile":Ljava/util/zip/ZipFile;
    const/4 v0, 0x0

    .line 75
    .local v0, "tries":I
    :goto_1
    add-int/lit8 v8, v0, 0x1

    .end local v0    # "tries":I
    .local v8, "tries":I
    const/4 v9, 0x5

    if-ge v0, v9, :cond_0

    .line 77
    :try_start_0
    new-instance v0, Ljava/util/zip/ZipFile;

    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v11, 0x1

    invoke-direct {v0, v10, v11}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v7, v0

    .line 78
    goto :goto_2

    .line 79
    :catch_0
    move-exception v0

    .line 80
    move v0, v8

    goto :goto_1

    .line 83
    :cond_0
    :goto_2
    if-nez v7, :cond_1

    .line 84
    move-object/from16 v15, p3

    move-object/from16 v9, p4

    goto :goto_5

    .line 87
    :cond_1
    const/4 v0, 0x0

    .line 88
    .end local v8    # "tries":I
    .restart local v0    # "tries":I
    :goto_3
    add-int/lit8 v8, v0, 0x1

    .end local v0    # "tries":I
    .restart local v8    # "tries":I
    if-ge v0, v9, :cond_4

    .line 89
    const/4 v0, 0x0

    .line 90
    .local v0, "jniNameInApk":Ljava/lang/String;
    const/4 v10, 0x0

    .line 92
    .local v10, "libraryEntry":Ljava/util/zip/ZipEntry;
    array-length v11, v1

    const/4 v12, 0x0

    :goto_4
    if-ge v12, v11, :cond_3

    aget-object v13, v1, v12

    .line 93
    .local v13, "abi":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "lib"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    sget-char v15, Ljava/io/File;->separatorChar:C

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    sget-char v15, Ljava/io/File;->separatorChar:C

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v15, p3

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 96
    const-string v14, "Looking for %s in APK %s..."

    filled-new-array {v0, v6}, [Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v9, p4

    invoke-virtual {v9, v14, v4}, Lcom/getkeepsafe/relinker/ReLinkerInstance;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 98
    invoke-virtual {v7, v0}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v10

    .line 100
    if-eqz v10, :cond_2

    .line 101
    new-instance v2, Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;

    invoke-direct {v2, v7, v10}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;-><init>(Ljava/util/zip/ZipFile;Ljava/util/zip/ZipEntry;)V

    return-object v2

    .line 92
    .end local v13    # "abi":Ljava/lang/String;
    :cond_2
    add-int/lit8 v12, v12, 0x1

    const/4 v9, 0x5

    goto :goto_4

    :cond_3
    move-object/from16 v15, p3

    move-object/from16 v9, p4

    .line 104
    .end local v0    # "jniNameInApk":Ljava/lang/String;
    .end local v10    # "libraryEntry":Ljava/util/zip/ZipEntry;
    move v0, v8

    const/4 v9, 0x5

    goto :goto_3

    .line 107
    :cond_4
    move-object/from16 v15, p3

    move-object/from16 v9, p4

    :try_start_1
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 109
    goto :goto_5

    .line 108
    :catch_1
    move-exception v0

    .line 72
    .end local v6    # "sourceDir":Ljava/lang/String;
    .end local v7    # "zipFile":Ljava/util/zip/ZipFile;
    .end local v8    # "tries":I
    :goto_5
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 112
    :cond_5
    move-object/from16 v15, p3

    move-object/from16 v9, p4

    const/4 v0, 0x0

    return-object v0
.end method

.method private getSupportedABIs(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/String;
    .locals 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mappedLibraryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "mappedLibraryName"
        }
    .end annotation

    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "lib"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "([^\\"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]*)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, "p":Ljava/lang/String;
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 123
    .local v1, "pattern":Ljava/util/regex/Pattern;
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 124
    .local v2, "supportedABIs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->sourceDirectories(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_2

    aget-object v6, v3, v5

    .line 126
    .local v6, "sourceDir":Ljava/lang/String;
    :try_start_0
    new-instance v7, Ljava/util/zip/ZipFile;

    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v9, 0x1

    invoke-direct {v7, v8, v9}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    .local v7, "zipFile":Ljava/util/zip/ZipFile;
    nop

    .line 131
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v8

    .line 132
    .local v8, "elements":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :goto_1
    invoke-interface {v8}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 133
    invoke-interface {v8}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/zip/ZipEntry;

    .line 134
    .local v10, "el":Ljava/util/zip/ZipEntry;
    invoke-virtual {v10}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v11}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    .line 135
    .local v11, "match":Ljava/util/regex/Matcher;
    invoke-virtual {v11}, Ljava/util/regex/Matcher;->matches()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 136
    invoke-virtual {v11, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v2, v12}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 138
    .end local v10    # "el":Ljava/util/zip/ZipEntry;
    .end local v11    # "match":Ljava/util/regex/Matcher;
    :cond_0
    goto :goto_1

    .line 127
    .end local v7    # "zipFile":Ljava/util/zip/ZipFile;
    .end local v8    # "elements":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :catch_0
    move-exception v7

    .line 128
    .local v7, "ignored":Ljava/io/IOException;
    nop

    .line 124
    .end local v6    # "sourceDir":Ljava/lang/String;
    .end local v7    # "ignored":Ljava/io/IOException;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 141
    :cond_2
    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    .line 142
    .local v3, "result":[Ljava/lang/String;
    invoke-interface {v2, v3}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    return-object v4
.end method

.method private sourceDirectories(Landroid/content/Context;)[Ljava/lang/String;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "context"
        }
    .end annotation

    .line 43
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 45
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->splitSourceDirs:[Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->splitSourceDirs:[Ljava/lang/String;

    array-length v1, v1

    if-eqz v1, :cond_0

    .line 48
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->splitSourceDirs:[Ljava/lang/String;

    array-length v1, v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    new-array v1, v1, [Ljava/lang/String;

    .line 49
    .local v1, "apks":[Ljava/lang/String;
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v1, v4

    .line 50
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->splitSourceDirs:[Ljava/lang/String;

    iget-object v5, v0, Landroid/content/pm/ApplicationInfo;->splitSourceDirs:[Ljava/lang/String;

    array-length v5, v5

    invoke-static {v3, v4, v1, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    return-object v1

    .line 53
    .end local v1    # "apks":[Ljava/lang/String;
    :cond_0
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public installLibrary(Landroid/content/Context;[Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Lcom/getkeepsafe/relinker/ReLinkerInstance;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "abis"    # [Ljava/lang/String;
    .param p3, "mappedLibraryName"    # Ljava/lang/String;
    .param p4, "destination"    # Ljava/io/File;
    .param p5, "instance"    # Lcom/getkeepsafe/relinker/ReLinkerInstance;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10,
            0x10,
            0x10,
            0x10
        }
        names = {
            "context",
            "abis",
            "mappedLibraryName",
            "destination",
            "instance"
        }
    .end annotation

    .line 160
    const/4 v0, 0x0

    .line 162
    .local v0, "found":Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;
    :try_start_0
    invoke-direct {p0, p1, p2, p3, p5}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->findAPKWithLibrary(Landroid/content/Context;[Ljava/lang/String;Ljava/lang/String;Lcom/getkeepsafe/relinker/ReLinkerInstance;)Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;

    move-result-object v1

    move-object v0, v1

    .line 163
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_5

    .line 178
    const/4 v3, 0x0

    .line 179
    .local v3, "tries":I
    :goto_0
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "tries":I
    .local v4, "tries":I
    const/4 v5, 0x5

    if-ge v3, v5, :cond_3

    .line 180
    const-string v3, "Found %s! Extracting..."

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p5, v3, v5}, Lcom/getkeepsafe/relinker/ReLinkerInstance;->log(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 182
    :try_start_1
    invoke-virtual {p4}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p4}, Ljava/io/File;->createNewFile()Z

    move-result v3
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-nez v3, :cond_0

    .line 183
    goto :goto_2

    .line 188
    :cond_0
    nop

    .line 190
    const/4 v3, 0x0

    .line 191
    .local v3, "inputStream":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 193
    .local v5, "fileOut":Ljava/io/FileOutputStream;
    :try_start_2
    iget-object v6, v0, Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;->zipFile:Ljava/util/zip/ZipFile;

    iget-object v7, v0, Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;->zipEntry:Ljava/util/zip/ZipEntry;

    invoke-virtual {v6, v7}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v6

    move-object v3, v6

    .line 194
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, p4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object v5, v6

    .line 195
    invoke-direct {p0, v3, v5}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    move-result-wide v6

    .line 196
    .local v6, "written":J
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/FileDescriptor;->sync()V

    .line 197
    invoke-virtual {p4}, Ljava/io/File;->length()J

    move-result-wide v8
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    cmp-long v8, v6, v8

    if-eqz v8, :cond_1

    .line 208
    :try_start_3
    invoke-direct {p0, v3}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->closeSilently(Ljava/io/Closeable;)V

    .line 209
    invoke-direct {p0, v5}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->closeSilently(Ljava/io/Closeable;)V

    .line 199
    goto :goto_2

    .line 208
    .end local v6    # "written":J
    :cond_1
    invoke-direct {p0, v3}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->closeSilently(Ljava/io/Closeable;)V

    .line 209
    invoke-direct {p0, v5}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->closeSilently(Ljava/io/Closeable;)V

    .line 210
    nop

    .line 213
    invoke-virtual {p4, v2, v1}, Ljava/io/File;->setReadable(ZZ)Z

    .line 214
    invoke-virtual {p4, v2, v1}, Ljava/io/File;->setExecutable(ZZ)Z

    .line 215
    invoke-virtual {p4, v2}, Ljava/io/File;->setWritable(Z)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 222
    if-eqz v0, :cond_2

    :try_start_4
    iget-object v1, v0, Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;->zipFile:Ljava/util/zip/ZipFile;

    if-eqz v1, :cond_2

    .line 223
    iget-object v1, v0, Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;->zipFile:Ljava/util/zip/ZipFile;

    invoke-virtual {v1}, Ljava/util/zip/ZipFile;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    .line 225
    :catch_0
    move-exception v1

    :cond_2
    :goto_1
    nop

    .line 216
    return-void

    .line 208
    :catchall_0
    move-exception v1

    :try_start_5
    invoke-direct {p0, v3}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->closeSilently(Ljava/io/Closeable;)V

    .line 209
    invoke-direct {p0, v5}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->closeSilently(Ljava/io/Closeable;)V

    .line 210
    nop

    .end local v0    # "found":Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "abis":[Ljava/lang/String;
    .end local p3    # "mappedLibraryName":Ljava/lang/String;
    .end local p4    # "destination":Ljava/io/File;
    .end local p5    # "instance":Lcom/getkeepsafe/relinker/ReLinkerInstance;
    throw v1

    .line 204
    .restart local v0    # "found":Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "abis":[Ljava/lang/String;
    .restart local p3    # "mappedLibraryName":Ljava/lang/String;
    .restart local p4    # "destination":Ljava/io/File;
    .restart local p5    # "instance":Lcom/getkeepsafe/relinker/ReLinkerInstance;
    :catch_1
    move-exception v6

    .line 208
    .local v6, "e":Ljava/io/IOException;
    invoke-direct {p0, v3}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->closeSilently(Ljava/io/Closeable;)V

    .line 209
    invoke-direct {p0, v5}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->closeSilently(Ljava/io/Closeable;)V

    .line 206
    goto :goto_2

    .line 201
    .end local v6    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v6

    .line 208
    .local v6, "e":Ljava/io/FileNotFoundException;
    invoke-direct {p0, v3}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->closeSilently(Ljava/io/Closeable;)V

    .line 209
    invoke-direct {p0, v5}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->closeSilently(Ljava/io/Closeable;)V

    .line 203
    goto :goto_2

    .line 185
    .end local v3    # "inputStream":Ljava/io/InputStream;
    .end local v5    # "fileOut":Ljava/io/FileOutputStream;
    .end local v6    # "e":Ljava/io/FileNotFoundException;
    :catch_3
    move-exception v3

    .line 187
    .local v3, "ignored":Ljava/io/IOException;
    nop

    .line 179
    .end local v3    # "ignored":Ljava/io/IOException;
    :goto_2
    move v3, v4

    goto/16 :goto_0

    .line 219
    :cond_3
    const-string v1, "FATAL! Couldn\'t extract the library from the APK!"

    invoke-virtual {p5, v1}, Lcom/getkeepsafe/relinker/ReLinkerInstance;->log(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 222
    .end local v4    # "tries":I
    if-eqz v0, :cond_4

    :try_start_6
    iget-object v1, v0, Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;->zipFile:Ljava/util/zip/ZipFile;

    if-eqz v1, :cond_4

    .line 223
    iget-object v1, v0, Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;->zipFile:Ljava/util/zip/ZipFile;

    invoke-virtual {v1}, Ljava/util/zip/ZipFile;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_3

    .line 225
    :catch_4
    move-exception v1

    .line 226
    goto :goto_4

    .line 225
    :cond_4
    :goto_3
    nop

    .line 227
    :goto_4
    return-void

    .line 168
    :cond_5
    :try_start_7
    invoke-direct {p0, p1, p3}, Lcom/getkeepsafe/relinker/ApkLibraryInstaller;->getSupportedABIs(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 174
    .local v1, "supportedABIs":[Ljava/lang/String;
    goto :goto_5

    .line 169
    .end local v1    # "supportedABIs":[Ljava/lang/String;
    :catch_5
    move-exception v3

    .line 172
    .local v3, "e":Ljava/lang/Exception;
    :try_start_8
    new-array v2, v2, [Ljava/lang/String;

    .line 173
    .local v2, "supportedABIs":[Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v1

    move-object v1, v2

    .line 175
    .end local v2    # "supportedABIs":[Ljava/lang/String;
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v1    # "supportedABIs":[Ljava/lang/String;
    :goto_5
    new-instance v2, Lcom/getkeepsafe/relinker/MissingLibraryException;

    invoke-direct {v2, p3, p2, v1}, Lcom/getkeepsafe/relinker/MissingLibraryException;-><init>(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    .end local v0    # "found":Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "abis":[Ljava/lang/String;
    .end local p3    # "mappedLibraryName":Ljava/lang/String;
    .end local p4    # "destination":Ljava/io/File;
    .end local p5    # "instance":Lcom/getkeepsafe/relinker/ReLinkerInstance;
    throw v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 221
    .end local v1    # "supportedABIs":[Ljava/lang/String;
    .restart local v0    # "found":Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "abis":[Ljava/lang/String;
    .restart local p3    # "mappedLibraryName":Ljava/lang/String;
    .restart local p4    # "destination":Ljava/io/File;
    .restart local p5    # "instance":Lcom/getkeepsafe/relinker/ReLinkerInstance;
    :catchall_1
    move-exception v1

    .line 222
    if-eqz v0, :cond_6

    :try_start_9
    iget-object v2, v0, Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;->zipFile:Ljava/util/zip/ZipFile;

    if-eqz v2, :cond_6

    .line 223
    iget-object v2, v0, Lcom/getkeepsafe/relinker/ApkLibraryInstaller$ZipFileInZipEntry;->zipFile:Ljava/util/zip/ZipFile;

    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    goto :goto_6

    .line 225
    :catch_6
    move-exception v2

    :cond_6
    :goto_6
    nop

    .line 226
    throw v1
.end method
