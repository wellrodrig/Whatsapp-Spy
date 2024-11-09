.class public Lcom/getkeepsafe/relinker/elf/ElfParser;
.super Ljava/lang/Object;
.source "ElfParser.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Lcom/getkeepsafe/relinker/elf/Elf;


# instance fields
.field private final MAGIC:I

.field private final channel:Ljava/nio/channels/FileChannel;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "file"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const v0, 0x464c457f

    iput v0, p0, Lcom/getkeepsafe/relinker/elf/ElfParser;->MAGIC:I

    .line 36
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 41
    .local v0, "inputStream":Ljava/io/FileInputStream;
    invoke-virtual {v0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    iput-object v1, p0, Lcom/getkeepsafe/relinker/elf/ElfParser;->channel:Ljava/nio/channels/FileChannel;

    .line 42
    return-void

    .line 37
    .end local v0    # "inputStream":Ljava/io/FileInputStream;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "File is null or does not exist"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private offsetFromVma(Lcom/getkeepsafe/relinker/elf/Elf$Header;JJ)J
    .locals 9
    .param p1, "header"    # Lcom/getkeepsafe/relinker/elf/Elf$Header;
    .param p2, "numEntries"    # J
    .param p4, "vma"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10,
            0x10
        }
        names = {
            "header",
            "numEntries",
            "vma"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    const-wide/16 v0, 0x0

    .local v0, "i":J
    :goto_0
    cmp-long v2, v0, p2

    if-gez v2, :cond_1

    .line 131
    invoke-virtual {p1, v0, v1}, Lcom/getkeepsafe/relinker/elf/Elf$Header;->getProgramHeader(J)Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;

    move-result-object v2

    .line 132
    .local v2, "programHeader":Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;
    iget-wide v3, v2, Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;->type:J

    const-wide/16 v5, 0x1

    cmp-long v3, v3, v5

    if-nez v3, :cond_0

    .line 134
    iget-wide v3, v2, Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;->vaddr:J

    cmp-long v3, v3, p4

    if-gtz v3, :cond_0

    iget-wide v3, v2, Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;->vaddr:J

    iget-wide v7, v2, Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;->memsz:J

    add-long/2addr v3, v7

    cmp-long v3, p4, v3

    if-gtz v3, :cond_0

    .line 136
    iget-wide v3, v2, Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;->vaddr:J

    sub-long v3, p4, v3

    iget-wide v5, v2, Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;->offset:J

    add-long/2addr v3, v5

    return-wide v3

    .line 130
    .end local v2    # "programHeader":Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;
    :cond_0
    add-long/2addr v0, v5

    goto :goto_0

    .line 141
    .end local v0    # "i":J
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Could not map vma to file offset!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 146
    iget-object v0, p0, Lcom/getkeepsafe/relinker/elf/ElfParser;->channel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 147
    return-void
.end method

.method public parseHeader()Lcom/getkeepsafe/relinker/elf/Elf$Header;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 45
    iget-object v0, p0, Lcom/getkeepsafe/relinker/elf/ElfParser;->channel:Ljava/nio/channels/FileChannel;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 48
    const/16 v0, 0x8

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 49
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 50
    invoke-virtual {p0, v0, v1, v2}, Lcom/getkeepsafe/relinker/elf/ElfParser;->readWord(Ljava/nio/ByteBuffer;J)J

    move-result-wide v1

    const-wide/32 v3, 0x464c457f

    cmp-long v1, v1, v3

    if-nez v1, :cond_3

    .line 54
    const-wide/16 v1, 0x4

    invoke-virtual {p0, v0, v1, v2}, Lcom/getkeepsafe/relinker/elf/ElfParser;->readByte(Ljava/nio/ByteBuffer;J)S

    move-result v1

    .line 55
    .local v1, "fileClass":S
    const-wide/16 v2, 0x5

    invoke-virtual {p0, v0, v2, v3}, Lcom/getkeepsafe/relinker/elf/ElfParser;->readByte(Ljava/nio/ByteBuffer;J)S

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x2

    if-ne v2, v4, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 56
    .local v2, "bigEndian":Z
    :goto_0
    if-ne v1, v3, :cond_1

    .line 57
    new-instance v3, Lcom/getkeepsafe/relinker/elf/Elf32Header;

    invoke-direct {v3, v2, p0}, Lcom/getkeepsafe/relinker/elf/Elf32Header;-><init>(ZLcom/getkeepsafe/relinker/elf/ElfParser;)V

    return-object v3

    .line 58
    :cond_1
    if-ne v1, v4, :cond_2

    .line 59
    new-instance v3, Lcom/getkeepsafe/relinker/elf/Elf64Header;

    invoke-direct {v3, v2, p0}, Lcom/getkeepsafe/relinker/elf/Elf64Header;-><init>(ZLcom/getkeepsafe/relinker/elf/ElfParser;)V

    return-object v3

    .line 62
    :cond_2
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Invalid class type!"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 51
    .end local v1    # "fileClass":S
    .end local v2    # "bigEndian":Z
    :cond_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid ELF Magic!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public parseNeededDependencies()Ljava/util/List;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    move-object/from16 v6, p0

    iget-object v0, v6, Lcom/getkeepsafe/relinker/elf/ElfParser;->channel:Ljava/nio/channels/FileChannel;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v7, v0

    .line 68
    .local v7, "dependencies":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/getkeepsafe/relinker/elf/ElfParser;->parseHeader()Lcom/getkeepsafe/relinker/elf/Elf$Header;

    move-result-object v8

    .line 69
    .local v8, "header":Lcom/getkeepsafe/relinker/elf/Elf$Header;
    const/16 v0, 0x8

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v9

    .line 70
    .local v9, "buffer":Ljava/nio/ByteBuffer;
    iget-boolean v0, v8, Lcom/getkeepsafe/relinker/elf/Elf$Header;->bigEndian:Z

    if-eqz v0, :cond_0

    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    goto :goto_0

    :cond_0
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    :goto_0
    invoke-virtual {v9, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 72
    iget v0, v8, Lcom/getkeepsafe/relinker/elf/Elf$Header;->phnum:I

    int-to-long v3, v0

    .line 73
    .local v3, "numProgramHeaderEntries":J
    const-wide/32 v10, 0xffff

    cmp-long v0, v3, v10

    if-nez v0, :cond_1

    .line 83
    const/4 v0, 0x0

    invoke-virtual {v8, v0}, Lcom/getkeepsafe/relinker/elf/Elf$Header;->getSectionHeader(I)Lcom/getkeepsafe/relinker/elf/Elf$SectionHeader;

    move-result-object v0

    .line 84
    .local v0, "sectionHeader":Lcom/getkeepsafe/relinker/elf/Elf$SectionHeader;
    iget-wide v3, v0, Lcom/getkeepsafe/relinker/elf/Elf$SectionHeader;->info:J

    move-wide v10, v3

    goto :goto_1

    .line 73
    .end local v0    # "sectionHeader":Lcom/getkeepsafe/relinker/elf/Elf$SectionHeader;
    :cond_1
    move-wide v10, v3

    .line 87
    .end local v3    # "numProgramHeaderEntries":J
    .local v10, "numProgramHeaderEntries":J
    :goto_1
    const-wide/16 v3, 0x0

    .line 88
    .local v3, "dynamicSectionOff":J
    const-wide/16 v12, 0x0

    .local v12, "i":J
    :goto_2
    cmp-long v0, v12, v10

    const-wide/16 v14, 0x1

    if-gez v0, :cond_3

    .line 89
    invoke-virtual {v8, v12, v13}, Lcom/getkeepsafe/relinker/elf/Elf$Header;->getProgramHeader(J)Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;

    move-result-object v0

    .line 90
    .local v0, "programHeader":Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;
    iget-wide v1, v0, Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;->type:J

    const-wide/16 v18, 0x2

    cmp-long v1, v1, v18

    if-nez v1, :cond_2

    .line 91
    iget-wide v3, v0, Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;->offset:J

    .line 92
    move-wide v12, v3

    goto :goto_3

    .line 88
    .end local v0    # "programHeader":Lcom/getkeepsafe/relinker/elf/Elf$ProgramHeader;
    :cond_2
    add-long/2addr v12, v14

    const-wide/16 v1, 0x0

    goto :goto_2

    :cond_3
    move-wide v12, v3

    .line 96
    .end local v3    # "dynamicSectionOff":J
    .local v12, "dynamicSectionOff":J
    :goto_3
    const-wide/16 v0, 0x0

    cmp-long v2, v12, v0

    if-nez v2, :cond_4

    .line 98
    invoke-static {v7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 101
    :cond_4
    const/4 v0, 0x0

    .line 102
    .local v0, "i":I
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object v4, v1

    .line 103
    .local v4, "neededOffsets":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    const-wide/16 v1, 0x0

    .line 106
    .local v1, "vStringTableOff":J
    :goto_4
    invoke-virtual {v8, v12, v13, v0}, Lcom/getkeepsafe/relinker/elf/Elf$Header;->getDynamicStructure(JI)Lcom/getkeepsafe/relinker/elf/Elf$DynamicStructure;

    move-result-object v5

    .line 107
    .local v5, "dynStructure":Lcom/getkeepsafe/relinker/elf/Elf$DynamicStructure;
    move-wide/from16 v18, v1

    .end local v1    # "vStringTableOff":J
    .local v18, "vStringTableOff":J
    iget-wide v1, v5, Lcom/getkeepsafe/relinker/elf/Elf$DynamicStructure;->tag:J

    cmp-long v1, v1, v14

    if-nez v1, :cond_5

    .line 108
    iget-wide v1, v5, Lcom/getkeepsafe/relinker/elf/Elf$DynamicStructure;->val:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 109
    :cond_5
    iget-wide v1, v5, Lcom/getkeepsafe/relinker/elf/Elf$DynamicStructure;->tag:J

    const-wide/16 v20, 0x5

    cmp-long v1, v1, v20

    if-nez v1, :cond_6

    .line 110
    iget-wide v1, v5, Lcom/getkeepsafe/relinker/elf/Elf$DynamicStructure;->val:J

    move-wide/from16 v18, v1

    .line 112
    :cond_6
    :goto_5
    add-int/lit8 v20, v0, 0x1

    .line 113
    .end local v0    # "i":I
    .local v20, "i":I
    iget-wide v0, v5, Lcom/getkeepsafe/relinker/elf/Elf$DynamicStructure;->tag:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_9

    .line 115
    cmp-long v0, v18, v2

    if-eqz v0, :cond_8

    .line 120
    move-object/from16 v0, p0

    move-object v1, v8

    move-wide v2, v10

    move-object/from16 v16, v4

    move-object/from16 v17, v5

    .end local v4    # "neededOffsets":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .end local v5    # "dynStructure":Lcom/getkeepsafe/relinker/elf/Elf$DynamicStructure;
    .local v16, "neededOffsets":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .local v17, "dynStructure":Lcom/getkeepsafe/relinker/elf/Elf$DynamicStructure;
    move-wide/from16 v4, v18

    invoke-direct/range {v0 .. v5}, Lcom/getkeepsafe/relinker/elf/ElfParser;->offsetFromVma(Lcom/getkeepsafe/relinker/elf/Elf$Header;JJ)J

    move-result-wide v0

    .line 121
    .local v0, "stringTableOff":J
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    .line 122
    .local v3, "strOff":Ljava/lang/Long;
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    add-long/2addr v4, v0

    invoke-virtual {v6, v9, v4, v5}, Lcom/getkeepsafe/relinker/elf/ElfParser;->readString(Ljava/nio/ByteBuffer;J)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v7, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .end local v3    # "strOff":Ljava/lang/Long;
    goto :goto_6

    .line 125
    :cond_7
    return-object v7

    .line 116
    .end local v0    # "stringTableOff":J
    .end local v16    # "neededOffsets":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .end local v17    # "dynStructure":Lcom/getkeepsafe/relinker/elf/Elf$DynamicStructure;
    .restart local v4    # "neededOffsets":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .restart local v5    # "dynStructure":Lcom/getkeepsafe/relinker/elf/Elf$DynamicStructure;
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "String table offset not found!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_9
    move-object/from16 v16, v4

    move-object/from16 v17, v5

    .end local v4    # "neededOffsets":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .end local v5    # "dynStructure":Lcom/getkeepsafe/relinker/elf/Elf$DynamicStructure;
    .restart local v16    # "neededOffsets":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .restart local v17    # "dynStructure":Lcom/getkeepsafe/relinker/elf/Elf$DynamicStructure;
    move-wide/from16 v1, v18

    move/from16 v0, v20

    goto :goto_4
.end method

.method protected read(Ljava/nio/ByteBuffer;JI)V
    .locals 6
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "offset"    # J
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x0,
            0x10
        }
        names = {
            "buffer",
            "offset",
            "length"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 180
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 181
    invoke-virtual {p1, p4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 182
    const-wide/16 v1, 0x0

    .line 183
    .local v1, "bytesRead":J
    :goto_0
    int-to-long v3, p4

    cmp-long v3, v1, v3

    if-gez v3, :cond_1

    .line 184
    iget-object v3, p0, Lcom/getkeepsafe/relinker/elf/ElfParser;->channel:Ljava/nio/channels/FileChannel;

    add-long v4, p2, v1

    invoke-virtual {v3, p1, v4, v5}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;J)I

    move-result v3

    .line 185
    .local v3, "read":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 189
    int-to-long v4, v3

    add-long/2addr v1, v4

    .line 190
    .end local v3    # "read":I
    goto :goto_0

    .line 186
    .restart local v3    # "read":I
    :cond_0
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 191
    .end local v3    # "read":I
    :cond_1
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 192
    return-void
.end method

.method protected readByte(Ljava/nio/ByteBuffer;J)S
    .locals 1
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "offset"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "buffer",
            "offset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 175
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/getkeepsafe/relinker/elf/ElfParser;->read(Ljava/nio/ByteBuffer;JI)V

    .line 176
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    return v0
.end method

.method protected readHalf(Ljava/nio/ByteBuffer;J)I
    .locals 2
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "offset"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "buffer",
            "offset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 170
    const/4 v0, 0x2

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/getkeepsafe/relinker/elf/ElfParser;->read(Ljava/nio/ByteBuffer;JI)V

    .line 171
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    return v0
.end method

.method protected readLong(Ljava/nio/ByteBuffer;J)J
    .locals 2
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "offset"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "buffer",
            "offset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 160
    const/16 v0, 0x8

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/getkeepsafe/relinker/elf/ElfParser;->read(Ljava/nio/ByteBuffer;JI)V

    .line 161
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    return-wide v0
.end method

.method protected readString(Ljava/nio/ByteBuffer;J)Ljava/lang/String;
    .locals 3
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "offset"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x0
        }
        names = {
            "buffer",
            "offset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .local v0, "builder":Ljava/lang/StringBuilder;
    :goto_0
    const-wide/16 v1, 0x1

    add-long/2addr v1, p2

    .end local p2    # "offset":J
    .local v1, "offset":J
    invoke-virtual {p0, p1, p2, p3}, Lcom/getkeepsafe/relinker/elf/ElfParser;->readByte(Ljava/nio/ByteBuffer;J)S

    move-result p2

    move p3, p2

    .local p3, "c":S
    if-eqz p2, :cond_0

    .line 153
    int-to-char p2, p3

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-wide p2, v1

    goto :goto_0

    .line 156
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    return-object p2
.end method

.method protected readWord(Ljava/nio/ByteBuffer;J)J
    .locals 4
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "offset"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "buffer",
            "offset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 165
    const/4 v0, 0x4

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/getkeepsafe/relinker/elf/ElfParser;->read(Ljava/nio/ByteBuffer;JI)V

    .line 166
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method
