.class public LjavalangEnum;
.super Ljava/lang/Object;
.source "javalangEnum.java"

# interfaces
.implements Ljava/lang/Comparable;
.implements Ljava/io/Serializable;


# instance fields
.field private final name:Ljava/lang/String;

.field private final ordinal:I


# direct methods
.method protected constructor <init>(Ljava/lang/String;I)V
    .locals 6

    .prologue
    .line 86
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v4, v0

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 87
    move-object v4, v0

    move-object v5, v1

    iput-object v5, v4, LjavalangEnum;->name:Ljava/lang/String;

    .line 88
    move-object v4, v0

    move v5, v2

    iput v5, v4, LjavalangEnum;->ordinal:I

    return-void
.end method

.method public static valueOf(Ljava/lang/Class;Ljava/lang/String;)LjavalangEnum;
    .locals 15

    .prologue
    .line 202
    move-object v0, p0

    move-object/from16 v1, p1

    move-object v5, v0

    invoke-virtual {v5}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    :try_start_0
    const-string v6, "javalangEnum"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    if-eq v5, v6, :cond_0

    .line 203
    new-instance v5, Ljava/lang/IllegalArgumentException;

    move-object v14, v5

    move-object v5, v14

    move-object v6, v14

    new-instance v7, Ljava/lang/StringBuffer;

    move-object v14, v7

    move-object v7, v14

    move-object v8, v14

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v8, Ljava/lang/StringBuffer;

    move-object v14, v8

    move-object v8, v14

    move-object v9, v14

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v9, Ljava/lang/StringBuffer;

    move-object v14, v9

    move-object v9, v14

    move-object v10, v14

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "No enum const "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    move-object v10, v0

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    move-object v8, v1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 202
    :catch_0
    move-exception v5

    move-object v2, v5

    new-instance v5, Ljava/lang/NoClassDefFoundError;

    move-object v14, v5

    move-object v5, v14

    move-object v6, v14

    move-object v7, v2

    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v5

    .line 206
    :cond_0
    move-object v5, v0

    :try_start_1
    const-string v6, "valueOf"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    move-object v14, v7

    move-object v7, v14

    move-object v8, v14

    const/4 v9, 0x0

    :try_start_2
    const-string v10, "java.lang.String"

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v10

    :try_start_3
    aput-object v10, v8, v9

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    move-object v14, v7

    move-object v7, v14

    move-object v8, v14

    const/4 v9, 0x0

    move-object v10, v1

    aput-object v10, v8, v9

    invoke-virtual {v5, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, LjavalangEnum;

    move-object v0, v5

    return-object v0

    :catch_1
    move-exception v5

    move-object v3, v5

    new-instance v5, Ljava/lang/NoClassDefFoundError;

    move-object v14, v5

    move-object v5, v14

    move-object v6, v14

    move-object v7, v3

    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2

    :catch_2
    move-exception v5

    move-object v3, v5

    .line 209
    new-instance v5, Ljava/lang/IllegalArgumentException;

    move-object v14, v5

    move-object v5, v14

    move-object v6, v14

    new-instance v7, Ljava/lang/StringBuffer;

    move-object v14, v7

    move-object v7, v14

    move-object v8, v14

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v8, Ljava/lang/StringBuffer;

    move-object v14, v8

    move-object v8, v14

    move-object v9, v14

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v9, Ljava/lang/StringBuffer;

    move-object v14, v9

    move-object v9, v14

    move-object v10, v14

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "No enum const "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    move-object v10, v0

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    move-object v8, v1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
.end method


# virtual methods
.method protected final clone()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 136
    move-object v0, p0

    new-instance v2, Ljava/lang/CloneNotSupportedException;

    move-object v4, v2

    move-object v2, v4

    move-object v3, v4

    invoke-direct {v3}, Ljava/lang/CloneNotSupportedException;-><init>()V

    throw v2
.end method

.method public compareTo(Ljava/lang/Object;)I
    .locals 8

    .prologue
    .line 155
    move-object v0, p0

    move-object v1, p1

    move-object v5, v1

    check-cast v5, LjavalangEnum;

    move-object v2, v5

    .line 156
    move-object v5, v0

    move-object v3, v5

    .line 157
    move-object v5, v3

    invoke-virtual {v5}, LjavalangEnum;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v5

    move-object v6, v2

    invoke-virtual {v6}, LjavalangEnum;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v6

    if-eq v5, v6, :cond_0

    .line 158
    new-instance v5, Ljava/lang/ClassCastException;

    move-object v7, v5

    move-object v5, v7

    move-object v6, v7

    invoke-direct {v6}, Ljava/lang/ClassCastException;-><init>()V

    throw v5

    .line 159
    :cond_0
    move-object v5, v3

    iget v5, v5, LjavalangEnum;->ordinal:I

    move-object v6, v2

    iget v6, v6, LjavalangEnum;->ordinal:I

    sub-int/2addr v5, v6

    move v0, v5

    return v0
.end method

.method public compareTo(LjavalangEnum;)I
    .locals 5

    .prologue
    .line 150
    move-object v0, p0

    move-object v1, p1

    move-object v3, v0

    move-object v4, v1

    check-cast v4, Ljava/lang/Object;

    invoke-virtual {v3, v4}, LjavalangEnum;->compareTo(Ljava/lang/Object;)I

    move-result v3

    move v0, v3

    return v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 5

    .prologue
    .line 114
    move-object v0, p0

    move-object v1, p1

    move-object v3, v0

    move-object v4, v1

    if-eq v3, v4, :cond_0

    const/4 v3, 0x0

    :goto_0
    move v0, v3

    return v0

    :cond_0
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public final getDeclaringClass()Ljava/lang/Class;
    .locals 11

    .prologue
    .line 176
    move-object v0, p0

    move-object v5, v0

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    move-object v1, v5

    .line 177
    move-object v5, v1

    invoke-virtual {v5}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    move-object v2, v5

    .line 178
    move-object v5, v2

    :try_start_0
    const-string v6, "javalangEnum"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    if-ne v5, v6, :cond_0

    move-object v5, v1

    :goto_0
    move-object v0, v5

    return-object v0

    :catch_0
    move-exception v5

    move-object v3, v5

    new-instance v5, Ljava/lang/NoClassDefFoundError;

    move-object v10, v5

    move-object v5, v10

    move-object v6, v10

    move-object v7, v3

    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_0
    move-object v5, v2

    goto :goto_0
.end method

.method public final hashCode()I
    .locals 3

    .prologue
    .line 124
    move-object v0, p0

    move-object v2, v0

    invoke-static {v2}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    move v0, v2

    return v0
.end method

.method public final name()Ljava/lang/String;
    .locals 3

    .prologue
    .line 44
    move-object v0, p0

    move-object v2, v0

    iget-object v2, v2, LjavalangEnum;->name:Ljava/lang/String;

    move-object v0, v2

    return-object v0
.end method

.method public final ordinal()I
    .locals 3

    .prologue
    .line 71
    move-object v0, p0

    move-object v2, v0

    iget v2, v2, LjavalangEnum;->ordinal:I

    move v0, v2

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 101
    move-object v0, p0

    move-object v2, v0

    iget-object v2, v2, LjavalangEnum;->name:Ljava/lang/String;

    move-object v0, v2

    return-object v0
.end method
