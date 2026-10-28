.class public Lcom/google/androidgamesdk/gametextinput/InputConnection;
.super Landroid/view/inputmethod/BaseInputConnection;
.source "InputConnection.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/androidgamesdk/gametextinput/InputConnection$SingeLineFilter;
    }
.end annotation


# static fields
.field private static final MAX_LENGTH_FOR_SINGLE_LINE_EDIT_TEXT:I = 0x1388

.field private static final TAG:Ljava/lang/String; = "gti.InputConnection"

.field private static final notInsertedKeyCodes:[I


# instance fields
.field private final dontInsertChars:Ljava/util/BitSet;

.field private final imm:Landroid/view/inputmethod/InputMethodManager;

.field private listener:Lcom/google/androidgamesdk/gametextinput/Listener;

.field private final mEditable:Landroid/text/Editable;

.field private mSoftKeyboardActive:Z

.field private final settings:Lcom/google/androidgamesdk/gametextinput/Settings;

.field private final targetView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x4a

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->notInsertedKeyCodes:[I

    return-void

    :array_0
    .array-data 4
        0x17
        0x14
        0x13
        0x15
        0x16
        0x10d
        0x10c
        0x10c
        0x10e
        0x60
        0x61
        0x63
        0x64
        0x66
        0x68
        0x67
        0x69
        0x6a
        0x6b
        0x6d
        0x6c
        0x6e
        0x82
        0x65
        0x62
        0x43
        0x70
        0x72
        0x3b
        0x3c
        0x4
        0x18
        0x19
        0xa4
        0x39
        0x3a
        0x71
        0x83
        0x8c
        0x8d
        0x8e
        0x84
        0x85
        0x86
        0x87
        0x88
        0x89
        0x8a
        0x8b
        0x7c
        0x7a
        0x7b
        0x5c
        0x5d
        0x0
        0x54
        0x55
        0x56
        0x57
        0x58
        0x59
        0x5a
        0x7e
        0x7f
        0x80
        0x81
        0x82
        0xde
        0xe2
        0x101
        0x110
        0x111
        0x112
        0x113
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;Lcom/google/androidgamesdk/gametextinput/Settings;)V
    .locals 5

    iget-object v0, p3, Lcom/google/androidgamesdk/gametextinput/Settings;->mEditorInfo:Landroid/view/inputmethod/EditorInfo;

    iget v0, v0, Landroid/view/inputmethod/EditorInfo;->inputType:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    invoke-direct {p0, p2, v0}, Landroid/view/inputmethod/BaseInputConnection;-><init>(Landroid/view/View;Z)V

    const-string v0, "gti.InputConnection"

    const/4 v2, 0x0

    sget-object v2, Lcom/braze/ui/contentcards/managers/YtBa/tqpVEKiY;->TCf:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p2, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->targetView:Landroid/view/View;

    iput-object p3, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->settings:Lcom/google/androidgamesdk/gametextinput/Settings;

    const-string v0, "input_method"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_2

    check-cast p1, Landroid/view/inputmethod/InputMethodManager;

    iput-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->imm:Landroid/view/inputmethod/InputMethodManager;

    new-instance p1, Landroid/text/SpannableStringBuilder;

    invoke-direct {p1}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    new-instance p1, Ljava/util/BitSet;

    invoke-direct {p1}, Ljava/util/BitSet;-><init>()V

    iput-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->dontInsertChars:Ljava/util/BitSet;

    sget-object p1, Lcom/google/androidgamesdk/gametextinput/InputConnection;->notInsertedKeyCodes:[I

    array-length v0, p1

    move v2, v1

    :goto_1
    if-ge v2, v0, :cond_1

    aget v3, p1, v2

    iget-object v4, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->dontInsertChars:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->set(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1, v1}, Landroidx/core/view/WindowCompat;->setDecorFitsSystemWindows(Landroid/view/Window;Z)V

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    iget-object p1, p3, Lcom/google/androidgamesdk/gametextinput/Settings;->mEditorInfo:Landroid/view/inputmethod/EditorInfo;

    invoke-virtual {p0, p1}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->setEditorInfo(Landroid/view/inputmethod/EditorInfo;)V

    return-void

    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Can\'t get IMM"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final getComposingRegion()Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;
    .locals 1

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-static {v0}, Lcom/google/androidgamesdk/gametextinput/GameTextInput;->getComposingRegion(Landroid/text/Editable;)Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    move-result-object v0

    return-object v0
.end method

.method private final getSelection()Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;
    .locals 1

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-static {v0}, Lcom/google/androidgamesdk/gametextinput/GameTextInput;->getSelection(Landroid/text/Editable;)Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    move-result-object v0

    return-object v0
.end method

.method private final informIMM()V
    .locals 8

    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->getSelection()Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    move-result-object v0

    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->getComposingRegion()Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    move-result-object v1

    iget-object v2, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->imm:Landroid/view/inputmethod/InputMethodManager;

    iget-object v3, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->targetView:Landroid/view/View;

    iget v4, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget v5, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->second:I

    iget v6, v1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget v7, v1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->second:I

    invoke-virtual/range {v2 .. v7}, Landroid/view/inputmethod/InputMethodManager;->updateSelection(Landroid/view/View;IIII)V

    return-void
.end method

.method private processKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 8

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "processKeyEvent(key=%d) text=%s"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "gti.InputConnection"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->settings:Lcom/google/androidgamesdk/gametextinput/Settings;

    iget-object v0, v0, Lcom/google/androidgamesdk/gametextinput/Settings;->mEditorInfo:Landroid/view/inputmethod/EditorInfo;

    iget v0, v0, Landroid/view/inputmethod/EditorInfo;->inputType:I

    const/high16 v2, 0x20000

    and-int/2addr v0, v2

    const/4 v2, 0x1

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v3, 0x42

    if-eq v0, v3, :cond_0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v3, 0xa0

    if-ne v0, v3, :cond_1

    :cond_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->settings:Lcom/google/androidgamesdk/gametextinput/Settings;

    iget-object p1, p1, Lcom/google/androidgamesdk/gametextinput/Settings;->mEditorInfo:Landroid/view/inputmethod/EditorInfo;

    iget p1, p1, Landroid/view/inputmethod/EditorInfo;->actionId:I

    invoke-virtual {p0, p1}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->performEditorAction(I)Z

    return v2

    :cond_1
    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->getSelection()Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    move-result-object v0

    const/4 v3, 0x0

    if-nez p1, :cond_2

    return v3

    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v4

    if-eqz v4, :cond_3

    return v2

    :cond_3
    iget v4, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_4

    iget-object v4, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-interface {v4}, Landroid/text/Editable;->length()I

    move-result v4

    iput v4, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget-object v4, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-interface {v4}, Landroid/text/Editable;->length()I

    move-result v4

    iput v4, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->second:I

    :cond_4
    iget v4, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget v6, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->second:I

    if-eq v4, v6, :cond_5

    const-string v4, "processKeyEvent: deleting selection"

    new-array v6, v3, [Ljava/lang/Object;

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    iget v6, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget v7, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->second:I

    invoke-interface {v4, v6, v7}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    move v4, v2

    goto :goto_0

    :cond_5
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    const/16 v6, 0x43

    if-ne v4, v6, :cond_6

    iget v4, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    if-lez v4, :cond_6

    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    iget v4, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    sub-int/2addr v4, v2

    iget v0, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    invoke-interface {p1, v4, v0}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    invoke-direct {p0, v3}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->stateUpdated(Z)V

    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "processKeyEvent: exit after DEL, text=%s"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_6
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    const/16 v6, 0x70

    if-ne v4, v6, :cond_7

    iget v4, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget-object v6, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-interface {v6}, Landroid/text/Editable;->length()I

    move-result v6

    if-ge v4, v6, :cond_7

    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    iget v4, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget v0, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    add-int/2addr v0, v2

    invoke-interface {p1, v4, v0}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    invoke-direct {p0, v3}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->stateUpdated(Z)V

    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "processKeyEvent: exit after FORWARD_DEL, text=%s"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_7
    move v4, v3

    :goto_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v6

    iget-object v7, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->dontInsertChars:Ljava/util/BitSet;

    invoke-virtual {v7, v6}, Ljava/util/BitSet;->get(I)Z

    move-result v6

    if-nez v6, :cond_9

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result p1

    int-to-char p1, p1

    invoke-static {p1}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object p1

    iget-object v4, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    iget v6, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    invoke-interface {v4, v6, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    iget-object v4, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-interface {v4}, Landroid/text/Editable;->length()I

    move-result v4

    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->getComposingRegion()Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    move-result-object v6

    iget v7, v6, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    if-ne v7, v5, :cond_8

    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->getSelection()Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    move-result-object v6

    iget v7, v6, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    if-ne v7, v5, :cond_8

    new-instance v6, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    invoke-direct {v6, v3, v3}, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;-><init>(II)V

    :cond_8
    iget v5, v6, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    add-int/2addr v5, v4

    iput v5, v6, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->second:I

    iget v4, v6, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget v5, v6, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->second:I

    invoke-virtual {p0, v4, v5}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->setComposingRegion(II)Z

    iget v0, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    add-int/2addr v0, p1

    invoke-direct {p0, v0, v0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->setSelectionInternal(II)V

    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->informIMM()V

    invoke-virtual {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->restartInput()V

    goto :goto_1

    :cond_9
    move v2, v4

    :goto_1
    if-eqz v2, :cond_a

    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "processKeyEvent: exit, text=%s"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, v3}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->stateUpdated(Z)V

    :cond_a
    return v2
.end method

.method private final setComposingRegionInternal(II)V
    .locals 2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    const/4 p2, -0x1

    if-ne v0, p2, :cond_0

    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-static {p1}, Lcom/google/androidgamesdk/gametextinput/GameTextInput;->removeComposingRegion(Landroid/text/Editable;)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-interface {p2}, Landroid/text/Editable;->length()I

    move-result p2

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-static {v0, p2, p1}, Lcom/google/androidgamesdk/gametextinput/GameTextInput;->setComposingRegion(Landroid/text/Editable;II)V

    :goto_0
    return-void
.end method

.method private final setSelectionInternal(II)V
    .locals 1

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-static {v0, p1, p2}, Lcom/google/androidgamesdk/gametextinput/GameTextInput;->setSelection(Landroid/text/Editable;II)V

    return-void
.end method

.method private final stateUpdated(Z)V
    .locals 9

    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->getSelection()Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    move-result-object v0

    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->getComposingRegion()Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    move-result-object v1

    new-instance v8, Lcom/google/androidgamesdk/gametextinput/State;

    iget-object v2, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iget v4, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget v5, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->second:I

    iget v6, v1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget v7, v1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->second:I

    move-object v2, v8

    invoke-direct/range {v2 .. v7}, Lcom/google/androidgamesdk/gametextinput/State;-><init>(Ljava/lang/String;IIII)V

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->listener:Lcom/google/androidgamesdk/gametextinput/Listener;

    if-eqz v0, :cond_0

    invoke-interface {v0, v8, p1}, Lcom/google/androidgamesdk/gametextinput/Listener;->stateChanged(Lcom/google/androidgamesdk/gametextinput/State;Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public closeConnection()V
    .locals 2

    const-string v0, "gti.InputConnection"

    const-string v1, "closeConnection"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0}, Landroid/view/inputmethod/BaseInputConnection;->closeConnection()V

    return-void
.end method

.method public commitText(Ljava/lang/CharSequence;I)Z
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    sget-object v1, Lorg/junit/internal/runners/rules/Nr/EkQUXJYDlBAx;->XIAGsUvoMq:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", new pos = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "gti.InputConnection"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, p1, p2}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->setComposingText(Ljava/lang/CharSequence;I)Z

    invoke-virtual {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->finishComposingText()Z

    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->informIMM()V

    const/4 p1, 0x1

    return p1
.end method

.method public deleteSurroundingText(II)Z
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "deleteSurroundingText: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "gti.InputConnection"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->getSelection()Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    move-result-object v0

    iget v2, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget v3, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->second:I

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget v3, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget v0, v0, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->second:I

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/4 v3, 0x0

    if-ge v2, v0, :cond_0

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget-object p2, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-interface {p2}, Landroid/text/Editable;->length()I

    move-result p2

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    goto :goto_0

    :cond_0
    sub-int/2addr v2, p1

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result p1

    add-int/2addr v0, p2

    iget-object p2, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-interface {p2}, Landroid/text/Editable;->length()I

    move-result p2

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v0, v2}, [Ljava/lang/Object;

    move-result-object v0

    const-string v2, "deleteSurroundingText: deleting text from %d to %d"

    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-interface {v0, p1, p2}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    invoke-direct {p0, v3}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->stateUpdated(Z)V

    const/4 p1, 0x1

    return p1
.end method

.method public deleteSurroundingTextInCodePoints(II)Z
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "deleteSurroundingTextInCodePoints: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "gti.InputConnection"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->deleteSurroundingTextInCodePoints(II)Z

    move-result p1

    const/4 p2, 0x0

    invoke-direct {p0, p2}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->stateUpdated(Z)V

    return p1
.end method

.method public finishComposingText()Z
    .locals 2

    const-string v0, "gti.InputConnection"

    const-string v1, "finishComposingText"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, -0x1

    invoke-virtual {p0, v0, v0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->setComposingRegion(II)Z

    const/4 v0, 0x1

    return v0
.end method

.method public getEditable()Landroid/text/Editable;
    .locals 2

    const-string v0, "gti.InputConnection"

    const-string v1, "getEditable "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    return-object v0
.end method

.method public final getEditorInfo()Landroid/view/inputmethod/EditorInfo;
    .locals 1

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->settings:Lcom/google/androidgamesdk/gametextinput/Settings;

    iget-object v0, v0, Lcom/google/androidgamesdk/gametextinput/Settings;->mEditorInfo:Landroid/view/inputmethod/EditorInfo;

    return-object v0
.end method

.method public getImeInsets()Landroidx/core/graphics/Insets;
    .locals 2

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->targetView:Landroid/view/View;

    if-nez v0, :cond_0

    sget-object v0, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    return-object v0

    :cond_0
    invoke-static {v0}, Landroidx/core/view/ViewCompat;->getRootWindowInsets(Landroid/view/View;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object v0

    if-nez v0, :cond_1

    sget-object v0, Landroidx/core/graphics/Insets;->NONE:Landroidx/core/graphics/Insets;

    return-object v0

    :cond_1
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->ime()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v0

    return-object v0
.end method

.method public final getListener()Lcom/google/androidgamesdk/gametextinput/Listener;
    .locals 1

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->listener:Lcom/google/androidgamesdk/gametextinput/Listener;

    return-object v0
.end method

.method public getSelectedText(I)Ljava/lang/CharSequence;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "getSelectedText: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "gti.InputConnection"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0, p1}, Landroid/view/inputmethod/BaseInputConnection;->getSelectedText(I)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public final getSoftKeyboardActive()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mSoftKeyboardActive:Z

    return v0
.end method

.method public getTextAfterCursor(II)Ljava/lang/CharSequence;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "getTextAfterCursor: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "gti.InputConnection"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-gez p1, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "getTextAfterCursor: returning null to due to an invalid length="

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->getTextAfterCursor(II)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public getTextBeforeCursor(II)Ljava/lang/CharSequence;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "getTextBeforeCursor: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", flags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "gti.InputConnection"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-gez p1, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "getTextBeforeCursor: returning null to due to an invalid length="

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->getTextBeforeCursor(II)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public isSoftwareKeyboardVisible()Z
    .locals 2

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->targetView:Landroid/view/View;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-static {v0}, Landroidx/core/view/ViewCompat;->getRootWindowInsets(Landroid/view/View;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->ime()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/core/view/WindowInsetsCompat;->isVisible(I)Z

    move-result v0

    return v0
.end method

.method public onApplyWindowInsets(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 1

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "onApplyWindowInsets"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->isSoftwareKeyboardVisible()Z

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "gti.InputConnection"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->listener:Lcom/google/androidgamesdk/gametextinput/Listener;

    if-eqz p1, :cond_0

    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->ime()I

    move-result v0

    invoke-virtual {p2, v0}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/google/androidgamesdk/gametextinput/Listener;->onImeInsetsChanged(Landroidx/core/graphics/Insets;)V

    :cond_0
    invoke-virtual {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->isSoftwareKeyboardVisible()Z

    move-result p1

    iget-boolean v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mSoftKeyboardActive:Z

    if-ne p1, v0, :cond_1

    return-object p2

    :cond_1
    iput-boolean p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mSoftKeyboardActive:Z

    if-nez p1, :cond_2

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->targetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    :cond_2
    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->listener:Lcom/google/androidgamesdk/gametextinput/Listener;

    if-eqz v0, :cond_3

    invoke-interface {v0, p1}, Lcom/google/androidgamesdk/gametextinput/Listener;->onSoftwareKeyboardVisibilityChanged(Z)V

    :cond_3
    return-object p2
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    invoke-direct {p0, p3}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->processKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public performEditorAction(I)Z
    .locals 1

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->listener:Lcom/google/androidgamesdk/gametextinput/Listener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/google/androidgamesdk/gametextinput/Listener;->onEditorAction(I)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public requestCursorUpdates(I)Z
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Request cursor updates: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "gti.InputConnection"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0, p1}, Landroid/view/inputmethod/BaseInputConnection;->requestCursorUpdates(I)Z

    move-result p1

    return p1
.end method

.method public restartInput()V
    .locals 2

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->imm:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->targetView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->restartInput(Landroid/view/View;)V

    return-void
.end method

.method public sendKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->settings:Lcom/google/androidgamesdk/gametextinput/Settings;

    iget-boolean v0, v0, Lcom/google/androidgamesdk/gametextinput/Settings;->mForwardKeyEvents:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->settings:Lcom/google/androidgamesdk/gametextinput/Settings;

    iget-object v0, v0, Lcom/google/androidgamesdk/gametextinput/Settings;->mEditorInfo:Landroid/view/inputmethod/EditorInfo;

    iget v0, v0, Landroid/view/inputmethod/EditorInfo;->inputType:I

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->imm:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->targetView:Landroid/view/View;

    invoke-virtual {v0, v1, p1}, Landroid/view/inputmethod/InputMethodManager;->dispatchKeyEventFromInputMethod(Landroid/view/View;Landroid/view/KeyEvent;)V

    :cond_0
    invoke-direct {p0, p1}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->processKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public setComposingRegion(II)Z
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "setComposingRegion: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "gti.InputConnection"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, p1, p2}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->setComposingRegionInternal(II)V

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->stateUpdated(Z)V

    const/4 p1, 0x1

    return p1
.end method

.method public setComposingText(Ljava/lang/CharSequence;I)Z
    .locals 5

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {p1, v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "setComposingText=\'%s\' newCursorPosition=%d"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "gti.InputConnection"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->getComposingRegion()Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    move-result-object v1

    iget v2, v1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->getSelection()Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    move-result-object v1

    iget v2, v1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    if-ne v2, v3, :cond_1

    new-instance v1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    invoke-direct {v1, v0, v0}, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;-><init>(II)V

    :cond_1
    iget-object v2, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    iget v3, v1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget v4, v1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->second:I

    invoke-interface {v2, v3, v4}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    iget-object v2, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    iget v3, v1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    invoke-interface {v2, v3, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    iget v2, v1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    iget v1, v1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    add-int/2addr v1, p1

    invoke-virtual {p0, v2, v1}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->setComposingRegion(II)Z

    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->getComposingRegion()Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;

    move-result-object p1

    const/4 v1, 0x1

    if-lez p2, :cond_2

    iget p1, p1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->second:I

    add-int/2addr p1, p2

    sub-int/2addr p1, v1

    iget-object p2, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-interface {p2}, Landroid/text/Editable;->length()I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    goto :goto_0

    :cond_2
    iget p1, p1, Lcom/google/androidgamesdk/gametextinput/GameTextInput$Pair;->first:I

    add-int/2addr p1, p2

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    :goto_0
    invoke-virtual {p0, p1, p1}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->setSelection(II)Z

    invoke-direct {p0, v0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->stateUpdated(Z)V

    return v1
.end method

.method public final setEditorInfo(Landroid/view/inputmethod/EditorInfo;)V
    .locals 4

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->settings:Lcom/google/androidgamesdk/gametextinput/Settings;

    iput-object p1, v0, Lcom/google/androidgamesdk/gametextinput/Settings;->mEditorInfo:Landroid/view/inputmethod/EditorInfo;

    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->settings:Lcom/google/androidgamesdk/gametextinput/Settings;

    iget-object p1, p1, Lcom/google/androidgamesdk/gametextinput/Settings;->mEditorInfo:Landroid/view/inputmethod/EditorInfo;

    iget p1, p1, Landroid/view/inputmethod/EditorInfo;->inputType:I

    const/high16 v0, 0x20000

    and-int/2addr p1, v0

    const/4 v0, 0x0

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/text/InputFilter;

    new-instance v2, Landroid/text/InputFilter$LengthFilter;

    const/16 v3, 0x1388

    invoke-direct {v2, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v2, v1, v0

    new-instance v0, Lcom/google/androidgamesdk/gametextinput/InputConnection$SingeLineFilter;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/google/androidgamesdk/gametextinput/InputConnection$SingeLineFilter;-><init>(Lcom/google/androidgamesdk/gametextinput/InputConnection;Lcom/google/androidgamesdk/gametextinput/InputConnection$1;)V

    const/4 v2, 0x1

    aput-object v0, v1, v2

    invoke-interface {p1, v1}, Landroid/text/Editable;->setFilters([Landroid/text/InputFilter;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    new-array v0, v0, [Landroid/text/InputFilter;

    invoke-interface {p1, v0}, Landroid/text/Editable;->setFilters([Landroid/text/InputFilter;)V

    :goto_0
    return-void
.end method

.method public final setListener(Lcom/google/androidgamesdk/gametextinput/Listener;)Lcom/google/androidgamesdk/gametextinput/InputConnection;
    .locals 0

    iput-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->listener:Lcom/google/androidgamesdk/gametextinput/Listener;

    return-object p0
.end method

.method public setSelection(II)Z
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "setSelection: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "gti.InputConnection"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, p1, p2}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->setSelectionInternal(II)V

    const/4 p1, 0x1

    return p1
.end method

.method public final setSoftKeyboardActive(ZI)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->targetView:Landroid/view/View;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->targetView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->imm:Landroid/view/inputmethod/InputMethodManager;

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->targetView:Landroid/view/View;

    invoke-virtual {p1, v0, p2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->imm:Landroid/view/inputmethod/InputMethodManager;

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->targetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    :goto_0
    return-void
.end method

.method public final setState(Lcom/google/androidgamesdk/gametextinput/State;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "setState: \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p1, Lcom/google/androidgamesdk/gametextinput/State;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', selection=("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p1, Lcom/google/androidgamesdk/gametextinput/State;->selectionStart:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p1, Lcom/google/androidgamesdk/gametextinput/State;->selectionEnd:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "), composing region=("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p1, Lcom/google/androidgamesdk/gametextinput/State;->composingRegionStart:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p1, Lcom/google/androidgamesdk/gametextinput/State;->composingRegionEnd:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "gti.InputConnection"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    invoke-interface {v0}, Landroid/text/Editable;->clear()V

    iget-object v0, p0, Lcom/google/androidgamesdk/gametextinput/InputConnection;->mEditable:Landroid/text/Editable;

    const/4 v1, 0x0

    iget-object v2, p1, Lcom/google/androidgamesdk/gametextinput/State;->text:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    iget v0, p1, Lcom/google/androidgamesdk/gametextinput/State;->selectionStart:I

    iget v1, p1, Lcom/google/androidgamesdk/gametextinput/State;->selectionEnd:I

    invoke-direct {p0, v0, v1}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->setSelectionInternal(II)V

    iget v0, p1, Lcom/google/androidgamesdk/gametextinput/State;->composingRegionStart:I

    iget p1, p1, Lcom/google/androidgamesdk/gametextinput/State;->composingRegionEnd:I

    invoke-direct {p0, v0, p1}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->setComposingRegionInternal(II)V

    invoke-direct {p0}, Lcom/google/androidgamesdk/gametextinput/InputConnection;->informIMM()V

    return-void
.end method
