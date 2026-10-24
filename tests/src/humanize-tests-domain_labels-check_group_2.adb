with Humanize.Colors;
with Humanize.Colors.Contrast;
with Humanize.Colors.Models;
with Humanize.Colors.Names;
with Humanize.Colors.Palettes;
with Humanize.Comments;
with Humanize.Comparisons;
with Humanize.Data_Quality;
with Humanize.Colors.Contrast.Localized;
with Humanize.Colors.Models.Localized;
with Humanize.Colors.Names.Localized;
with Humanize.Colors.Palettes.Localized;
with Humanize.Comments.Localized;
with Humanize.Comparisons.Localized;
with Humanize.Data_Quality.Localized;

separate (Humanize.Tests.Domain_Labels)
procedure Check_Group_2 (Locale : String; C : Humanize.Contexts.Context) is
   use Humanize.Colors;
begin
   Check (Locale, "label.contrast.apca_contrast_label", Phrase,
          Humanize.Colors.Contrast.Localized.APCA_Contrast_Label (C, (0, 204, 0), (162, 228, 116)),
          Humanize.Colors.Contrast.APCA_Contrast_Label ((0, 204, 0), (162, 228, 116)));
   Check (Locale, "label.contrast.apca_contrast_label", Phrase,
          Humanize.Colors.Contrast.Localized.APCA_Contrast_Label (C, (66, 182, 223), (127, 31, 253)),
          Humanize.Colors.Contrast.APCA_Contrast_Label ((66, 182, 223), (127, 31, 253)));
   Check (Locale, "label.contrast.alpha_contrast_label", Phrase,
          Humanize.Colors.Contrast.Localized.Alpha_Contrast_Label (C, (0, 204, 0), (162, 228, 116), 0.77),
          Humanize.Colors.Contrast.Alpha_Contrast_Label ((0, 204, 0), (162, 228, 116), 0.77));
   Check (Locale, "label.contrast.alpha_contrast_label", Phrase,
          Humanize.Colors.Contrast.Localized.Alpha_Contrast_Label (C, (66, 182, 223), (127, 31, 253), 0.92),
          Humanize.Colors.Contrast.Alpha_Contrast_Label ((66, 182, 223), (127, 31, 253), 0.92));
   Check (Locale, "label.contrast.color_accessibility_summary", Phrase,
          Humanize.Colors.Contrast.Localized.Color_Accessibility_Summary (C, (0, 204, 0), (162, 228, 116)),
          Humanize.Colors.Contrast.Color_Accessibility_Summary ((0, 204, 0), (162, 228, 116)));
   Check (Locale, "label.contrast.color_accessibility_summary", Phrase,
          Humanize.Colors.Contrast.Localized.Color_Accessibility_Summary (C, (66, 182, 223), (127, 31, 253)),
          Humanize.Colors.Contrast.Color_Accessibility_Summary ((66, 182, 223), (127, 31, 253)));
   Check (Locale, "label.contrast.color_vision_deficiency_label", Phrase,
          Humanize.Colors.Contrast.Localized.Color_Vision_Deficiency_Label (C, (153, 51, 204), (204, 102, 0),
            Protanopia),
          Humanize.Colors.Contrast.Color_Vision_Deficiency_Label ((153, 51, 204), (204, 102, 0), Protanopia));
   Check (Locale, "label.contrast.color_vision_deficiency_label", Phrase,
          Humanize.Colors.Contrast.Localized.Color_Vision_Deficiency_Label (C, (153, 51, 204), (204, 102, 0),
            Deuteranopia),
          Humanize.Colors.Contrast.Color_Vision_Deficiency_Label ((153, 51, 204), (204, 102, 0), Deuteranopia));
   Check (Locale, "label.contrast.contrast_label", Phrase,
          Humanize.Colors.Contrast.Localized.Contrast_Label (C, (0, 204, 0), (162, 228, 116)),
          Humanize.Colors.Contrast.Contrast_Label ((0, 204, 0), (162, 228, 116)));
   Check (Locale, "label.contrast.contrast_label", Phrase,
          Humanize.Colors.Contrast.Localized.Contrast_Label (C, (66, 182, 223), (127, 31, 253)),
          Humanize.Colors.Contrast.Contrast_Label ((66, 182, 223), (127, 31, 253)));
   Check (Locale, "label.contrast.contrast_remediation_label", Phrase,
          Humanize.Colors.Contrast.Localized.Contrast_Remediation_Label (C, (153, 51, 51), (153, 255, 255),
            Target_Large_Text),
          Humanize.Colors.Contrast.Contrast_Remediation_Label ((153, 51, 51), (153, 255, 255), Target_Large_Text));
   Check (Locale, "label.contrast.contrast_remediation_label", Phrase,
          Humanize.Colors.Contrast.Localized.Contrast_Remediation_Label (C, (153, 51, 51), (153, 255, 255),
            Target_Normal_Text),
          Humanize.Colors.Contrast.Contrast_Remediation_Label ((153, 51, 51), (153, 255, 255), Target_Normal_Text));
   Check (Locale, "label.contrast.opacity_label", Phrase,
          Humanize.Colors.Contrast.Localized.Opacity_Label (C, Opacity => 7.25),
          Humanize.Colors.Contrast.Opacity_Label (Opacity => 7.25));
   Check (Locale, "label.contrast.readability_label", Phrase,
          Humanize.Colors.Contrast.Localized.Readability_Label (C, (0, 204, 0), (162, 228, 116)),
          Humanize.Colors.Contrast.Readability_Label ((0, 204, 0), (162, 228, 116)));
   Check (Locale, "label.contrast.readability_label", Phrase,
          Humanize.Colors.Contrast.Localized.Readability_Label (C, (66, 182, 223), (127, 31, 253)),
          Humanize.Colors.Contrast.Readability_Label ((66, 182, 223), (127, 31, 253)));
   Check (Locale, "label.models.brightness_label", Phrase,
          Humanize.Colors.Models.Localized.Brightness_Label (C, (0, 0, 0)),
          Humanize.Colors.Models.Brightness_Label ((0, 0, 0)));
   Check (Locale, "label.models.brightness_label", Phrase,
          Humanize.Colors.Models.Localized.Brightness_Label (C, (0, 0, 51)),
          Humanize.Colors.Models.Brightness_Label ((0, 0, 51)));
   Check (Locale, "label.models.color_difference_label", Phrase,
          Humanize.Colors.Models.Localized.Color_Difference_Label (C, (0, 204, 0), (162, 228, 116)),
          Humanize.Colors.Models.Color_Difference_Label ((0, 204, 0), (162, 228, 116)));
   Check (Locale, "label.models.color_difference_label", Phrase,
          Humanize.Colors.Models.Localized.Color_Difference_Label (C, (66, 182, 223), (127, 31, 253)),
          Humanize.Colors.Models.Color_Difference_Label ((66, 182, 223), (127, 31, 253)));
   Check (Locale, "label.models.perceptual_difference_label", Phrase,
          Humanize.Colors.Models.Localized.Perceptual_Difference_Label (C, (0, 204, 0), (162, 228, 116)),
          Humanize.Colors.Models.Perceptual_Difference_Label ((0, 204, 0), (162, 228, 116)));
   Check (Locale, "label.models.perceptual_difference_label", Phrase,
          Humanize.Colors.Models.Localized.Perceptual_Difference_Label (C, (66, 182, 223), (127, 31, 253)),
          Humanize.Colors.Models.Perceptual_Difference_Label ((66, 182, 223), (127, 31, 253)));
   Check (Locale, "label.models.perceptual_difference_label", Phrase,
          Humanize.Colors.Models.Localized.Perceptual_Difference_Label (C, (153, 51, 204), (204, 102, 0),
            Perceptual_CIE76),
          Humanize.Colors.Models.Perceptual_Difference_Label ((153, 51, 204), (204, 102, 0), Perceptual_CIE76));
   Check (Locale, "label.models.perceptual_difference_label", Phrase,
          Humanize.Colors.Models.Localized.Perceptual_Difference_Label (C, (153, 51, 204), (204, 102, 0),
            Perceptual_CIE94_Graphic_Arts),
          Humanize.Colors.Models.Perceptual_Difference_Label ((153, 51, 204), (204, 102, 0),
            Perceptual_CIE94_Graphic_Arts));
   Check (Locale, "label.names.chroma_label", Phrase,
          Humanize.Colors.Names.Localized.Chroma_Label (C, (0, 0, 0)),
          Humanize.Colors.Names.Chroma_Label ((0, 0, 0)));
   Check (Locale, "label.names.chroma_label", Phrase,
          Humanize.Colors.Names.Localized.Chroma_Label (C, (0, 0, 51)),
          Humanize.Colors.Names.Chroma_Label ((0, 0, 51)));
   Check (Locale, "label.names.color_description", Phrase,
          Humanize.Colors.Names.Localized.Color_Description (C, (0, 0, 0)),
          Humanize.Colors.Names.Color_Description ((0, 0, 0)));
   Check (Locale, "label.names.color_description", Phrase,
          Humanize.Colors.Names.Localized.Color_Description (C, (0, 0, 51)),
          Humanize.Colors.Names.Color_Description ((0, 0, 51)));
   Check (Locale, "label.names.descriptive_color_name", Phrase,
          Humanize.Colors.Names.Localized.Descriptive_Color_Name (C, (0, 0, 0)),
          Humanize.Colors.Names.Descriptive_Color_Name ((0, 0, 0)));
   Check (Locale, "label.names.descriptive_color_name", Phrase,
          Humanize.Colors.Names.Localized.Descriptive_Color_Name (C, (0, 0, 51)),
          Humanize.Colors.Names.Descriptive_Color_Name ((0, 0, 51)));
   Check (Locale, "label.names.hue_family_label", Phrase,
          Humanize.Colors.Names.Localized.Hue_Family_Label (C, (0, 0, 0)),
          Humanize.Colors.Names.Hue_Family_Label ((0, 0, 0)));
   Check (Locale, "label.names.hue_family_label", Phrase,
          Humanize.Colors.Names.Localized.Hue_Family_Label (C, (0, 0, 51)),
          Humanize.Colors.Names.Hue_Family_Label ((0, 0, 51)));
   Check (Locale, "label.names.nearest_color_name", Phrase,
          Humanize.Colors.Names.Localized.Nearest_Color_Name (C, (0, 0, 0)),
          Humanize.Colors.Names.Nearest_Color_Name ((0, 0, 0)));
   Check (Locale, "label.names.nearest_color_name", Phrase,
          Humanize.Colors.Names.Localized.Nearest_Color_Name (C, (0, 0, 51)),
          Humanize.Colors.Names.Nearest_Color_Name ((0, 0, 51)));
   Check (Locale, "label.names.saturation_label", Phrase,
          Humanize.Colors.Names.Localized.Saturation_Label (C, (0, 0, 0)),
          Humanize.Colors.Names.Saturation_Label ((0, 0, 0)));
   Check (Locale, "label.names.saturation_label", Phrase,
          Humanize.Colors.Names.Localized.Saturation_Label (C, (0, 0, 51)),
          Humanize.Colors.Names.Saturation_Label ((0, 0, 51)));
   Check (Locale, "label.names.temperature_label", Phrase,
          Humanize.Colors.Names.Localized.Temperature_Label (C, (0, 0, 0)),
          Humanize.Colors.Names.Temperature_Label ((0, 0, 0)));
   Check (Locale, "label.names.temperature_label", Phrase,
          Humanize.Colors.Names.Localized.Temperature_Label (C, (0, 0, 51)),
          Humanize.Colors.Names.Temperature_Label ((0, 0, 51)));
   Check (Locale, "label.palettes.advanced_palette_summary", Phrase,
          Humanize.Colors.Palettes.Localized.Advanced_Palette_Summary (C, Color_List'((33, 155, 1), (195, 244, 101),
            (79, 146, 150), (225, 165, 93), (102, 102, 0))),
          Humanize.Colors.Palettes.Advanced_Palette_Summary (Color_List'((33, 155, 1), (195, 244, 101), (79, 146,
            150), (225, 165, 93), (102, 102, 0))));
   Check (Locale, "label.palettes.advanced_palette_summary", Phrase,
          Humanize.Colors.Palettes.Localized.Advanced_Palette_Summary (C, Color_List'((121, 176, 128), (252, 127,
            24), (191, 28, 70), (51, 51, 255), (51, 0, 153), (162, 245, 140))),
          Humanize.Colors.Palettes.Advanced_Palette_Summary (Color_List'((121, 176, 128), (252, 127, 24), (191, 28,
            70), (51, 51, 255), (51, 0, 153), (162, 245, 140))));
   Check (Locale, "label.palettes.palette_accessibility_label", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Accessibility_Label (C, Color_List'((33, 155, 1), (195, 244,
            101), (79, 146, 150), (225, 165, 93), (102, 102, 0))),
          Humanize.Colors.Palettes.Palette_Accessibility_Label (Color_List'((33, 155, 1), (195, 244, 101), (79, 146,
            150), (225, 165, 93), (102, 102, 0))));
   Check (Locale, "label.palettes.palette_accessibility_label", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Accessibility_Label (C, Color_List'((121, 176, 128), (252, 127,
            24), (191, 28, 70), (51, 51, 255), (51, 0, 153), (162, 245, 140))),
          Humanize.Colors.Palettes.Palette_Accessibility_Label (Color_List'((121, 176, 128), (252, 127, 24), (191,
            28, 70), (51, 51, 255), (51, 0, 153), (162, 245, 140))));
   Check (Locale, "label.palettes.palette_contrast_matrix_label", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Contrast_Matrix_Label (C, Color_List'((33, 155, 1), (195, 244,
            101), (79, 146, 150), (225, 165, 93), (102, 102, 0))),
          Humanize.Colors.Palettes.Palette_Contrast_Matrix_Label (Color_List'((33, 155, 1), (195, 244, 101), (79,
            146, 150), (225, 165, 93), (102, 102, 0))));
   Check (Locale, "label.palettes.palette_contrast_matrix_label", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Contrast_Matrix_Label (C, Color_List'((121, 176, 128), (252,
            127, 24), (191, 28, 70), (51, 51, 255), (51, 0, 153), (162, 245, 140))),
          Humanize.Colors.Palettes.Palette_Contrast_Matrix_Label (Color_List'((121, 176, 128), (252, 127, 24), (191,
            28, 70), (51, 51, 255), (51, 0, 153), (162, 245, 140))));
   Check (Locale, "label.palettes.palette_contrast_suggestion", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Contrast_Suggestion (C, Color_List'((33, 155, 1), (195, 244,
            101), (79, 146, 150), (225, 165, 93), (102, 102, 0))),
          Humanize.Colors.Palettes.Palette_Contrast_Suggestion (Color_List'((33, 155, 1), (195, 244, 101), (79, 146,
            150), (225, 165, 93), (102, 102, 0))));
   Check (Locale, "label.palettes.palette_contrast_suggestion", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Contrast_Suggestion (C, Color_List'((121, 176, 128), (252, 127,
            24), (191, 28, 70), (51, 51, 255), (51, 0, 153), (162, 245, 140))),
          Humanize.Colors.Palettes.Palette_Contrast_Suggestion (Color_List'((121, 176, 128), (252, 127, 24), (191,
            28, 70), (51, 51, 255), (51, 0, 153), (162, 245, 140))));
   Check (Locale, "label.palettes.palette_harmony_label", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Harmony_Label (C, Color_List'((33, 155, 1), (195, 244, 101),
            (79, 146, 150), (225, 165, 93), (102, 102, 0))),
          Humanize.Colors.Palettes.Palette_Harmony_Label (Color_List'((33, 155, 1), (195, 244, 101), (79, 146, 150),
            (225, 165, 93), (102, 102, 0))));
   Check (Locale, "label.palettes.palette_harmony_label", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Harmony_Label (C, Color_List'((121, 176, 128), (252, 127, 24),
            (191, 28, 70), (51, 51, 255), (51, 0, 153), (162, 245, 140))),
          Humanize.Colors.Palettes.Palette_Harmony_Label (Color_List'((121, 176, 128), (252, 127, 24), (191, 28,
            70), (51, 51, 255), (51, 0, 153), (162, 245, 140))));
   Check (Locale, "label.palettes.palette_metadata_label", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Metadata_Label (C, Color_List'((33, 155, 1), (195, 244, 101),
            (79, 146, 150), (225, 165, 93), (102, 102, 0))),
          Humanize.Colors.Palettes.Palette_Metadata_Label (Color_List'((33, 155, 1), (195, 244, 101), (79, 146,
            150), (225, 165, 93), (102, 102, 0))));
   Check (Locale, "label.palettes.palette_metadata_label", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Metadata_Label (C, Color_List'((121, 176, 128), (252, 127, 24),
            (191, 28, 70), (51, 51, 255), (51, 0, 153), (162, 245, 140))),
          Humanize.Colors.Palettes.Palette_Metadata_Label (Color_List'((121, 176, 128), (252, 127, 24), (191, 28,
            70), (51, 51, 255), (51, 0, 153), (162, 245, 140))));
   Check (Locale, "label.palettes.palette_mood_label", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Mood_Label (C, Color_List'((33, 155, 1), (195, 244, 101), (79,
            146, 150), (225, 165, 93), (102, 102, 0))),
          Humanize.Colors.Palettes.Palette_Mood_Label (Color_List'((33, 155, 1), (195, 244, 101), (79, 146, 150),
            (225, 165, 93), (102, 102, 0))));
   Check (Locale, "label.palettes.palette_mood_label", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Mood_Label (C, Color_List'((121, 176, 128), (252, 127, 24),
            (191, 28, 70), (51, 51, 255), (51, 0, 153), (162, 245, 140))),
          Humanize.Colors.Palettes.Palette_Mood_Label (Color_List'((121, 176, 128), (252, 127, 24), (191, 28, 70),
            (51, 51, 255), (51, 0, 153), (162, 245, 140))));
   Check (Locale, "label.palettes.palette_roles", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Roles (C, Color_List'((33, 155, 1), (195, 244, 101), (79, 146,
            150), (225, 165, 93), (102, 102, 0))),
          Humanize.Colors.Palettes.Palette_Roles (Color_List'((33, 155, 1), (195, 244, 101), (79, 146, 150), (225,
            165, 93), (102, 102, 0))));
   Check (Locale, "label.palettes.palette_roles", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Roles (C, Color_List'((121, 176, 128), (252, 127, 24), (191,
            28, 70), (51, 51, 255), (51, 0, 153), (162, 245, 140))),
          Humanize.Colors.Palettes.Palette_Roles (Color_List'((121, 176, 128), (252, 127, 24), (191, 28, 70), (51,
            51, 255), (51, 0, 153), (162, 245, 140))));
   Check (Locale, "label.palettes.palette_summary", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Summary (C, Color_List'((33, 155, 1), (195, 244, 101), (79,
            146, 150), (225, 165, 93), (102, 102, 0))),
          Humanize.Colors.Palettes.Palette_Summary (Color_List'((33, 155, 1), (195, 244, 101), (79, 146, 150), (225,
            165, 93), (102, 102, 0))));
   Check (Locale, "label.palettes.palette_summary", Phrase,
          Humanize.Colors.Palettes.Localized.Palette_Summary (C, Color_List'((121, 176, 128), (252, 127, 24), (191,
            28, 70), (51, 51, 255), (51, 0, 153), (162, 245, 140))),
          Humanize.Colors.Palettes.Palette_Summary (Color_List'((121, 176, 128), (252, 127, 24), (191, 28, 70), (51,
            51, 255), (51, 0, 153), (162, 245, 140))));
   Check (Locale, "label.comments.author_action_label", Phrase,
          Humanize.Comments.Localized.Author_Action_Label (C, Author => "plain", State =>
            Humanize.Comments.Draft_Comment),
          Humanize.Comments.Author_Action_Label (Author => "plain", State => Humanize.Comments.Draft_Comment));
   Check (Locale, "label.comments.author_action_label", Phrase,
          Humanize.Comments.Localized.Author_Action_Label (C, Author => "plain", State =>
            Humanize.Comments.Hidden_Comment),
          Humanize.Comments.Author_Action_Label (Author => "plain", State => Humanize.Comments.Hidden_Comment));
   Check (Locale, "label.comments.comment_count_label", Phrase,
          Humanize.Comments.Localized.Comment_Count_Label (C, Count => 3),
          Humanize.Comments.Comment_Count_Label (Count => 3));
   Check (Locale, "label.comments.comment_count_label", Phrase,
          Humanize.Comments.Localized.Comment_Count_Label (C, Count => 1),
          Humanize.Comments.Comment_Count_Label (Count => 1));
   Check (Locale, "label.comments.comment_label", Phrase,
          Humanize.Comments.Localized.Comment_Label (C, Author => "plain", State =>
            Humanize.Comments.Draft_Comment),
          Humanize.Comments.Comment_Label (Author => "plain", State => Humanize.Comments.Draft_Comment));
   Check (Locale, "label.comments.comment_label", Phrase,
          Humanize.Comments.Localized.Comment_Label (C, Author => "plain", State =>
            Humanize.Comments.Hidden_Comment),
          Humanize.Comments.Comment_Label (Author => "plain", State => Humanize.Comments.Hidden_Comment));
   Check (Locale, "label.comments.comment_label", Prefix,
          Humanize.Comments.Localized.Comment_Label (C, Author => "plain", State => Humanize.Comments.Draft_Comment,
            Options => (Humanize.Comments.Default_Comment_Label_Options with delta Include_Surface => True)),
          Humanize.Comments.Comment_Label (Author => "plain", State => Humanize.Comments.Draft_Comment, Options =>
            (Humanize.Comments.Default_Comment_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.comments.comment_state_label", Phrase,
          Humanize.Comments.Localized.Comment_State_Label (C, State => Humanize.Comments.Draft_Comment),
          Humanize.Comments.Comment_State_Label (State => Humanize.Comments.Draft_Comment));
   Check (Locale, "label.comments.comment_state_label", Phrase,
          Humanize.Comments.Localized.Comment_State_Label (C, State => Humanize.Comments.Hidden_Comment),
          Humanize.Comments.Comment_State_Label (State => Humanize.Comments.Hidden_Comment));
   Check (Locale, "label.comments.deleted_label", Phrase,
          Humanize.Comments.Localized.Deleted_Label (C, Author => "plain"),
          Humanize.Comments.Deleted_Label (Author => "plain"));
   Check (Locale, "label.comments.edited_label", Phrase,
          Humanize.Comments.Localized.Edited_Label (C, Time_Text => "plain"),
          Humanize.Comments.Edited_Label (Time_Text => "plain"));
   Check (Locale, "label.comments.hide_comment_label", Phrase,
          Humanize.Comments.Localized.Hide_Comment_Label (C, Reason => "plain"),
          Humanize.Comments.Hide_Comment_Label (Reason => "plain"));
   Check (Locale, "label.comments.lock_thread_label", Phrase,
          Humanize.Comments.Localized.Lock_Thread_Label (C, Name => "plain"),
          Humanize.Comments.Lock_Thread_Label (Name => "plain"));
   Check (Locale, "label.comments.mention_label", Phrase,
          Humanize.Comments.Localized.Mention_Label (C, Actor => "plain", Target => "plain"),
          Humanize.Comments.Mention_Label (Actor => "plain", Target => "plain"));
   Check (Locale, "label.comments.participant_count_label", Phrase,
          Humanize.Comments.Localized.Participant_Count_Label (C, Count => 3),
          Humanize.Comments.Participant_Count_Label (Count => 3));
   Check (Locale, "label.comments.participant_count_label", Phrase,
          Humanize.Comments.Localized.Participant_Count_Label (C, Count => 1),
          Humanize.Comments.Participant_Count_Label (Count => 1));
   Check (Locale, "label.comments.pin_label", Phrase,
          Humanize.Comments.Localized.Pin_Label (C, Name => "plain"),
          Humanize.Comments.Pin_Label (Name => "plain"));
   Check (Locale, "label.comments.reaction_kind_label", Phrase,
          Humanize.Comments.Localized.Reaction_Kind_Label (C, Kind => Humanize.Comments.Like_Reaction),
          Humanize.Comments.Reaction_Kind_Label (Kind => Humanize.Comments.Like_Reaction));
   Check (Locale, "label.comments.reaction_kind_label", Phrase,
          Humanize.Comments.Localized.Reaction_Kind_Label (C, Kind => Humanize.Comments.Eyes_Reaction),
          Humanize.Comments.Reaction_Kind_Label (Kind => Humanize.Comments.Eyes_Reaction));
   Check (Locale, "label.comments.reaction_label", Phrase,
          Humanize.Comments.Localized.Reaction_Label (C, Kind => Humanize.Comments.Like_Reaction, Count => 3),
          Humanize.Comments.Reaction_Label (Kind => Humanize.Comments.Like_Reaction, Count => 3));
   Check (Locale, "label.comments.reaction_label", Phrase,
          Humanize.Comments.Localized.Reaction_Label (C, Kind => Humanize.Comments.Eyes_Reaction, Count => 1),
          Humanize.Comments.Reaction_Label (Kind => Humanize.Comments.Eyes_Reaction, Count => 1));
   Check (Locale, "label.comments.reply_count_label", Phrase,
          Humanize.Comments.Localized.Reply_Count_Label (C, Count => 3),
          Humanize.Comments.Reply_Count_Label (Count => 3));
   Check (Locale, "label.comments.reply_count_label", Phrase,
          Humanize.Comments.Localized.Reply_Count_Label (C, Count => 1),
          Humanize.Comments.Reply_Count_Label (Count => 1));
   Check (Locale, "label.comments.resolved_label", Phrase,
          Humanize.Comments.Localized.Resolved_Label (C, Name => "plain"),
          Humanize.Comments.Resolved_Label (Name => "plain"));
   Check (Locale, "label.comments.subscribe_label", Phrase,
          Humanize.Comments.Localized.Subscribe_Label (C, Name => "plain"),
          Humanize.Comments.Subscribe_Label (Name => "plain"));
   Check (Locale, "label.comments.thread_count_label", Phrase,
          Humanize.Comments.Localized.Thread_Count_Label (C, Count => 3),
          Humanize.Comments.Thread_Count_Label (Count => 3));
   Check (Locale, "label.comments.thread_count_label", Phrase,
          Humanize.Comments.Localized.Thread_Count_Label (C, Count => 1),
          Humanize.Comments.Thread_Count_Label (Count => 1));
   Check (Locale, "label.comments.thread_label", Phrase,
          Humanize.Comments.Localized.Thread_Label (C, Name => "plain", State => Humanize.Comments.Open_Thread,
            Count => 3),
          Humanize.Comments.Thread_Label (Name => "plain", State => Humanize.Comments.Open_Thread, Count => 3));
   Check (Locale, "label.comments.thread_label", Phrase,
          Humanize.Comments.Localized.Thread_Label (C, Name => "plain", State => Humanize.Comments.Archived_Thread,
            Count => 1),
          Humanize.Comments.Thread_Label (Name => "plain", State => Humanize.Comments.Archived_Thread, Count => 1));
   Check (Locale, "label.comments.thread_label", Prefix,
          Humanize.Comments.Localized.Thread_Label (C, Name => "plain", State => Humanize.Comments.Open_Thread,
            Count => 3, Options => (Humanize.Comments.Default_Comment_Label_Options with delta Include_Surface =>
            True)),
          Humanize.Comments.Thread_Label (Name => "plain", State => Humanize.Comments.Open_Thread, Count => 3,
            Options => (Humanize.Comments.Default_Comment_Label_Options with delta Include_Surface => True)));
   Check (Locale, "label.comments.thread_state_label", Phrase,
          Humanize.Comments.Localized.Thread_State_Label (C, State => Humanize.Comments.Open_Thread),
          Humanize.Comments.Thread_State_Label (State => Humanize.Comments.Open_Thread));
   Check (Locale, "label.comments.thread_state_label", Phrase,
          Humanize.Comments.Localized.Thread_State_Label (C, State => Humanize.Comments.Archived_Thread),
          Humanize.Comments.Thread_State_Label (State => Humanize.Comments.Archived_Thread));
   Check (Locale, "label.comments.unpin_label", Phrase,
          Humanize.Comments.Localized.Unpin_Label (C, Name => "plain"),
          Humanize.Comments.Unpin_Label (Name => "plain"));
   Check (Locale, "label.comments.unsubscribe_label", Phrase,
          Humanize.Comments.Localized.Unsubscribe_Label (C, Name => "plain"),
          Humanize.Comments.Unsubscribe_Label (Name => "plain"));
   Check (Locale, "label.comparisons.baseline_label", Phrase,
          Humanize.Comparisons.Localized.Baseline_Label (C, Name => "plain", Result =>
            Humanize.Comparisons.Improved),
          Humanize.Comparisons.Baseline_Label (Name => "plain", Result => Humanize.Comparisons.Improved));
   Check (Locale, "label.comparisons.baseline_label", Phrase,
          Humanize.Comparisons.Localized.Baseline_Label (C, Name => "plain", Result =>
            Humanize.Comparisons.Baseline_Unavailable),
          Humanize.Comparisons.Baseline_Label (Name => "plain", Result =>
            Humanize.Comparisons.Baseline_Unavailable));
   Check (Locale, "label.comparisons.comparison_result_label", Phrase,
          Humanize.Comparisons.Localized.Comparison_Result_Label (C, Result => Humanize.Comparisons.Improved),
          Humanize.Comparisons.Comparison_Result_Label (Result => Humanize.Comparisons.Improved));
   Check (Locale, "label.comparisons.comparison_result_label", Phrase,
          Humanize.Comparisons.Localized.Comparison_Result_Label (C, Result =>
            Humanize.Comparisons.Baseline_Unavailable),
          Humanize.Comparisons.Comparison_Result_Label (Result => Humanize.Comparisons.Baseline_Unavailable));
   Check (Locale, "label.comparisons.difference_label", Phrase,
          Humanize.Comparisons.Localized.Difference_Label (C, Name => "plain", Difference_Text => "plain", Result =>
            Humanize.Comparisons.Improved),
          Humanize.Comparisons.Difference_Label (Name => "plain", Difference_Text => "plain", Result =>
            Humanize.Comparisons.Improved));
   Check (Locale, "label.comparisons.difference_label", Phrase,
          Humanize.Comparisons.Localized.Difference_Label (C, Name => "plain", Difference_Text => "plain", Result =>
            Humanize.Comparisons.Baseline_Unavailable),
          Humanize.Comparisons.Difference_Label (Name => "plain", Difference_Text => "plain", Result =>
            Humanize.Comparisons.Baseline_Unavailable));
   Check (Locale, "label.comparisons.multi_value_summary", Phrase,
          Humanize.Comparisons.Localized.Multi_Value_Summary (C, Name => "plain", Changed => 2, Unchanged => 2,
            Total => 4),
          Humanize.Comparisons.Multi_Value_Summary (Name => "plain", Changed => 2, Unchanged => 2, Total => 4));
   Check (Locale, "label.comparisons.multi_value_summary", Phrase,
          Humanize.Comparisons.Localized.Multi_Value_Summary (C, Name => "plain", Changed => 1, Unchanged => 0,
            Total => 1),
          Humanize.Comparisons.Multi_Value_Summary (Name => "plain", Changed => 1, Unchanged => 0, Total => 1));
   Check (Locale, "label.comparisons.multi_value_summary", Plain,
          Humanize.Comparisons.Localized.Multi_Value_Summary (C, Name => "plain", Changed => 2, Unchanged => 2,
            Total => 4, Options => (Mode => Humanize.Comparisons.Comparison_Log)),
          Humanize.Comparisons.Multi_Value_Summary (Name => "plain", Changed => 2, Unchanged => 2, Total => 4,
            Options => (Mode => Humanize.Comparisons.Comparison_Log)));
   Check (Locale, "label.comparisons.multi_value_summary", Plain,
          Humanize.Comparisons.Localized.Multi_Value_Summary (C, Name => "plain", Changed => 1, Unchanged => 0,
            Total => 1, Options => (Mode => Humanize.Comparisons.Comparison_Compact)),
          Humanize.Comparisons.Multi_Value_Summary (Name => "plain", Changed => 1, Unchanged => 0, Total => 1,
            Options => (Mode => Humanize.Comparisons.Comparison_Compact)));
   Check (Locale, "label.comparisons.tolerance_label", Phrase,
          Humanize.Comparisons.Localized.Tolerance_Label (C, Name => "plain", Difference_Text => "plain",
            Tolerance_Text => "plain", Result => Humanize.Comparisons.Improved),
          Humanize.Comparisons.Tolerance_Label (Name => "plain", Difference_Text => "plain", Tolerance_Text =>
            "plain", Result => Humanize.Comparisons.Improved));
   Check (Locale, "label.comparisons.tolerance_label", Phrase,
          Humanize.Comparisons.Localized.Tolerance_Label (C, Name => "plain", Difference_Text => "plain",
            Tolerance_Text => "plain", Result => Humanize.Comparisons.Baseline_Unavailable),
          Humanize.Comparisons.Tolerance_Label (Name => "plain", Difference_Text => "plain", Tolerance_Text =>
            "plain", Result => Humanize.Comparisons.Baseline_Unavailable));
   Check (Locale, "label.data_quality.data_issue_label", Phrase,
          Humanize.Data_Quality.Localized.Data_Issue_Label (C, Issue => Humanize.Data_Quality.Invalid_Row),
          Humanize.Data_Quality.Data_Issue_Label (Issue => Humanize.Data_Quality.Invalid_Row));
   Check (Locale, "label.data_quality.data_issue_label", Phrase,
          Humanize.Data_Quality.Localized.Data_Issue_Label (C, Issue => Humanize.Data_Quality.Skipped_Record),
          Humanize.Data_Quality.Data_Issue_Label (Issue => Humanize.Data_Quality.Skipped_Record));
   Check (Locale, "label.data_quality.import_check_state_label", Phrase,
          Humanize.Data_Quality.Localized.Import_Check_State_Label (C, State =>
            Humanize.Data_Quality.Dry_Run_Passed),
          Humanize.Data_Quality.Import_Check_State_Label (State => Humanize.Data_Quality.Dry_Run_Passed));
   Check (Locale, "label.data_quality.import_check_state_label", Phrase,
          Humanize.Data_Quality.Localized.Import_Check_State_Label (C, State =>
            Humanize.Data_Quality.Import_Partial),
          Humanize.Data_Quality.Import_Check_State_Label (State => Humanize.Data_Quality.Import_Partial));
   Check (Locale, "label.data_quality.import_result_label", Phrase,
          Humanize.Data_Quality.Localized.Import_Result_Label (C, Name => "plain", State =>
            Humanize.Data_Quality.Dry_Run_Passed, Accepted => 3, Rejected => 3),
          Humanize.Data_Quality.Import_Result_Label (Name => "plain", State => Humanize.Data_Quality.Dry_Run_Passed,
            Accepted => 3, Rejected => 3));
   Check (Locale, "label.data_quality.import_result_label", Phrase,
          Humanize.Data_Quality.Localized.Import_Result_Label (C, Name => "plain", State =>
            Humanize.Data_Quality.Import_Partial, Accepted => 1, Rejected => 1),
          Humanize.Data_Quality.Import_Result_Label (Name => "plain", State => Humanize.Data_Quality.Import_Partial,
            Accepted => 1, Rejected => 1));
   Check (Locale, "label.data_quality.import_result_label", Prefix,
          Humanize.Data_Quality.Localized.Import_Result_Label (C, Name => "plain", State =>
            Humanize.Data_Quality.Dry_Run_Passed, Accepted => 3, Rejected => 3, Options =>
            (Humanize.Data_Quality.Default_Data_Quality_Label_Options with delta Include_Surface => True)),
          Humanize.Data_Quality.Import_Result_Label (Name => "plain", State => Humanize.Data_Quality.Dry_Run_Passed,
            Accepted => 3, Rejected => 3, Options => (Humanize.Data_Quality.Default_Data_Quality_Label_Options with
            delta Include_Surface => True)));
   Check (Locale, "label.data_quality.issue_count_label", Phrase,
          Humanize.Data_Quality.Localized.Issue_Count_Label (C, Issue => Humanize.Data_Quality.Invalid_Row, Count =>
            3),
          Humanize.Data_Quality.Issue_Count_Label (Issue => Humanize.Data_Quality.Invalid_Row, Count => 3));
   Check (Locale, "label.data_quality.issue_count_label", Phrase,
          Humanize.Data_Quality.Localized.Issue_Count_Label (C, Issue => Humanize.Data_Quality.Skipped_Record, Count
            => 1),
          Humanize.Data_Quality.Issue_Count_Label (Issue => Humanize.Data_Quality.Skipped_Record, Count => 1));
   Check (Locale, "label.data_quality.row_issue_label", Phrase,
          Humanize.Data_Quality.Localized.Row_Issue_Label (C, Row => 3, Issue => Humanize.Data_Quality.Invalid_Row),
          Humanize.Data_Quality.Row_Issue_Label (Row => 3, Issue => Humanize.Data_Quality.Invalid_Row));
   Check (Locale, "label.data_quality.row_issue_label", Phrase,
          Humanize.Data_Quality.Localized.Row_Issue_Label (C, Row => 1, Issue =>
            Humanize.Data_Quality.Skipped_Record),
          Humanize.Data_Quality.Row_Issue_Label (Row => 1, Issue => Humanize.Data_Quality.Skipped_Record));
   Check (Locale, "label.data_quality.source_file_issue_label", Phrase,
          Humanize.Data_Quality.Localized.Source_File_Issue_Label (C, File_Name => "plain", Issue =>
            Humanize.Data_Quality.Invalid_Row),
          Humanize.Data_Quality.Source_File_Issue_Label (File_Name => "plain", Issue =>
            Humanize.Data_Quality.Invalid_Row));
   Check (Locale, "label.data_quality.source_file_issue_label", Phrase,
          Humanize.Data_Quality.Localized.Source_File_Issue_Label (C, File_Name => "plain", Issue =>
            Humanize.Data_Quality.Skipped_Record),
          Humanize.Data_Quality.Source_File_Issue_Label (File_Name => "plain", Issue =>
            Humanize.Data_Quality.Skipped_Record));
end Check_Group_2;
