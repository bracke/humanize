separate (Humanize.Catalogs.Phrase_Data.Locale_Hi)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {खाता {name}: "
      & "सक्रिय} invited_account {खाता {name}: "
      & "आमंत्रित} locked_account {खाता {name}: "
      & "लॉक} suspended_account {खाता {name}: "
      & "निलंबित} deleted_account {खाता {name}: "
      & "हटाया गया} other {खाता {name}: "
      & "स्थिति अज्ञात}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {सक्रिय खाता} "
      & "invited_account {आमंत्रित खाता} locked_account "
      & "{लॉक किया गया खाता} suspended_account "
      & "{निलंबित खाता} deleted_account {हटाया "
      & "गया खाता} other {खाते की स्थिति "
      & "अज्ञात}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {विश्वसनीय "
      & "डिवाइस} untrusted_device {अविश्वसनीय "
      & "डिवाइस} new_device {नया डिवाइस} other "
      & "{अवरुद्ध डिवाइस}}");
   P ("label.accounts.last_active_label", "{name} अंतिम बार सक्रिय: {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: लॉगिन विफल} other "
      & "{{name}: लॉगिन सफल}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA सक्षम} mfa_disabled {MFA "
      & "अक्षम} mfa_required {MFA आवश्यक} other {MFA "
      & "रीसेट आवश्यक}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {सत्र {name}: "
      & "सक्रिय} expired_session {सत्र {name}: "
      & "समाप्त} revoked_session {सत्र {name}: "
      & "रद्द} idle_session {सत्र {name}: "
      & "निष्क्रिय} other {सत्र {name}: "
      & "स्थिति अज्ञात}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {सक्रिय सत्र} "
      & "expired_session {सत्र समाप्त} revoked_session "
      & "{सत्र रद्द} idle_session {निष्क्रिय "
      & "सत्र} other {सत्र की स्थिति "
      & "अज्ञात}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {कोई अटैचमेंट नहीं} "
      & "one {1 अटैचमेंट} other {{count, number} "
      & "अटैचमेंट}}");
   P ("label.attachments.attachment_group_label", "{name}: {count, number} अटैचमेंट");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {फ़ाइल "
      & "अटैचमेंट} image_attachment {छवि "
      & "अटैचमेंट} video_attachment {वीडियो "
      & "अटैचमेंट} audio_attachment {ऑडियो "
      & "अटैचमेंट} document_attachment "
      & "{दस्तावेज़ अटैचमेंट} "
      & "archive_attachment {आर्काइव अटैचमेंट} "
      & "other {लिंक अटैचमेंट}}");
   P ("label.attachments.attachment_label",
      "अटैचमेंट {name} ({kind, select, file_attachment "
      & "{फ़ाइल} image_attachment {छवि} video_attachment "
      & "{वीडियो} audio_attachment {ऑडियो} "
      & "document_attachment {दस्तावेज़} archive_attachment "
      & "{आर्काइव} other {लिंक}}): {state, select, "
      & "pending_attachment {लंबित} uploading_attachment "
      & "{अपलोड हो रहा है} uploaded_attachment "
      & "{अपलोड हुआ} failed_attachment {विफल} "
      & "removed_attachment {हटाया गया} other "
      & "{अवरुद्ध}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {लंबित "
      & "अटैचमेंट} uploading_attachment "
      & "{अटैचमेंट अपलोड हो रहा है} "
      & "uploaded_attachment {अपलोड किया गया "
      & "अटैचमेंट} failed_attachment {विफल "
      & "अटैचमेंट} removed_attachment {हटाया "
      & "गया अटैचमेंट} other {अवरुद्ध "
      & "अटैचमेंट}}");
   P ("label.attachments.download_label", "{name} डाउनलोड करें");
   P ("label.attachments.expiring_link_label", "{name} लिंक की समय-सीमा: {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "{name} का पूर्वावलोकन");
   P ("label.attachments.remove_label", "{name} हटाएँ");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: स्कैन नहीं "
      & "किया गया} scanning {{name}: स्कैन हो "
      & "रहा है} safe {{name}: सुरक्षित} suspicious "
      & "{{name}: संदिग्ध} other {{name}: "
      & "संक्रमित}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {स्कैन नहीं किया "
      & "गया} scanning {स्कैन हो रहा है} safe "
      & "{स्कैन: सुरक्षित} suspicious "
      & "{स्कैन: संदिग्ध} other {स्कैन: "
      & "संक्रमित}}");
   P ("label.attachments.upload_error_label", "{name} अपलोड विफल: {reason}");
   P ("label.badges.badge_label",
      "बैज {name} ({tone, select, neutral_tone {तटस्थ} "
      & "info_tone {जानकारी} success_tone {सफलता} "
      & "warning_tone {चेतावनी} danger_tone {ख़तरा} "
      & "other {मंद}}{state, select, default_badge {} new_badge {, "
      & "नया} updated_badge {, अपडेट किया गया} "
      & "deprecated_badge {, अप्रचलित} selected_badge {, "
      & "चयनित} disabled_badge {, अक्षम} other {, "
      & "ख़ारिज करने योग्य}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {कम प्राथमिकता "
      & "बैज} medium_priority {मध्यम "
      & "प्राथमिकता बैज} high_priority {उच्च "
      & "प्राथमिकता बैज} other {गंभीर "
      & "प्राथमिकता बैज}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {डिफ़ॉल्ट बैज} "
      & "new_badge {नया बैज} updated_badge {अपडेट "
      & "किया गया बैज} deprecated_badge "
      & "{अप्रचलित बैज} selected_badge {चयनित "
      & "बैज} disabled_badge {अक्षम बैज} other "
      & "{ख़ारिज करने योग्य बैज}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {तटस्थ बैज} info_tone "
      & "{जानकारी बैज} success_tone {सफलता "
      & "बैज} warning_tone {चेतावनी बैज} danger_tone "
      & "{ख़तरा बैज} other {मंद बैज}}");
   P ("label.badges.chip_label",
      "{selected, select, false {चिप {name}} other {चिप {name}, "
      & "चयनित}}");
   P ("label.badges.count_badge_label",
      "{name}: {count, plural, =0 {कोई नहीं} other {{count, "
      & "number}}}");
   P ("label.badges.deprecated_label", "बैज {name} (चेतावनी, अप्रचलित)");
   P ("label.badges.dismiss_label", "{name} ख़ारिज करें");
   P ("label.badges.new_label", "बैज {name} (जानकारी, नया)");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {कोई छिपा बैज "
      & "नहीं} other {+{hidden_count, number} और बैज}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {बैज {name}, कम "
      & "प्राथमिकता} medium_priority {बैज {name}, "
      & "मध्यम प्राथमिकता} high_priority "
      & "{बैज {name}, उच्च प्राथमिकता} other "
      & "{बैज {name}, गंभीर प्राथमिकता}}");
   P ("label.badges.status_badge_label",
      "{name} स्थिति: {tone, select, neutral_tone "
      & "{तटस्थ} info_tone {जानकारी} success_tone "
      & "{सफलता} warning_tone {चेतावनी} danger_tone "
      & "{ख़तरा} other {मंद}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {कोई टैग नहीं} other {{count, "
      & "number} टैग}}");
   P ("label.badges.tag_label", "टैग {name}");
   P ("label.badges.updated_label",
      "बैज {name} (सफलता, अपडेट किया "
      & "गया)");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {आर्टिफ़ैक्ट "
      & "अपलोड हुआ} artifact_missing "
      & "{आर्टिफ़ैक्ट गायब} artifact_expired "
      & "{आर्टिफ़ैक्ट की समय-सीमा "
      & "समाप्त} other {आर्टिफ़ैक्ट "
      & "सत्यापित}}");
   P ("label.builds.benchmark_label", "बेंचमार्क {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {बिल्ड {name}: कतार "
      & "में} build_running {बिल्ड {name}: चल रहा "
      & "है} build_passed {बिल्ड {name}: सफल} build_failed "
      & "{बिल्ड {name}: विफल} snapshot_build "
      & "{स्नैपशॉट बिल्ड {name}} other "
      & "{रिलीज़ बिल्ड {name}}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {बिल्ड कतार में} "
      & "build_running {बिल्ड चल रहा है} build_passed "
      & "{बिल्ड सफल} build_failed {बिल्ड "
      & "विफल} snapshot_build {स्नैपशॉट "
      & "बिल्ड} other {रिलीज़ बिल्ड}}");
   P ("label.builds.coverage_label", "कवरेज {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {रिलीज़ गेट पास} "
      & "gate_failed {रिलीज़ गेट विफल} gate_warning "
      & "{रिलीज़ गेट पर चेतावनी} other "
      & "{रिलीज़ गेट अवरुद्ध}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {कोई "
      & "टेस्ट पास नहीं} other {{count, number} "
      & "टेस्ट पास}}} failed_test {{count, plural, =0 "
      & "{कोई टेस्ट विफल नहीं} other {{count, "
      & "number} टेस्ट विफल}}} skipped_test {{count, plural, "
      & "=0 {कोई टेस्ट छोड़ा नहीं गया} "
      & "one {1 टेस्ट छोड़ा गया} other {{count, "
      & "number} टेस्ट छोड़े गए}}} flaky_test {{count, "
      & "plural, =0 {कोई अस्थिर टेस्ट नहीं} "
      & "other {{count, number} अस्थिर टेस्ट}}} other "
      & "{{count, plural, =0 {कोई टेस्ट "
      & "अपेक्षित रूप से विफल नहीं} "
      & "other {{count, number} टेस्ट अपेक्षित "
      & "रूप से विफल}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {पास} failed_test {विफल} "
      & "skipped_test {छोड़ा गया} flaky_test "
      & "{अस्थिर} other {अपेक्षित "
      & "विफलता}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "अपरिवर्तित, अक्षम} other {{field_name} "
      & "अक्षम से सक्षम किया गया}}} other "
      & "{{new_value, select, false {{field_name} सक्षम से "
      & "अक्षम किया गया} other {{field_name} "
      & "अपरिवर्तित, सक्षम}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {जोड़ा गया} removed_change "
      & "{हटाया गया} modified_change {बदला गया} "
      & "renamed_change {नाम बदला गया} unchanged_change "
      & "{अपरिवर्तित} metadata_change "
      & "{मेटाडेटा बदला गया} moved_change "
      & "{स्थानांतरित} conflict_change {विरोध} "
      & "other {अज्ञात परिवर्तन}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {सूचनात्मक "
      & "परिवर्तन} minor_change {छोटा "
      & "परिवर्तन} major_change {बड़ा "
      & "परिवर्तन} other {असंगत करने "
      & "वाला परिवर्तन}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} "
      & "अपरिवर्तित} other {{unchanged, plural, =0 "
      & "{{field_name} बदला गया: {added, number} जोड़े "
      & "गए} other {{field_name} बदला गया: {added, number} "
      & "जोड़े गए, {unchanged, number} "
      & "अपरिवर्तित}}}}} other {{added, plural, =0 "
      & "{{unchanged, plural, =0 {{field_name} बदला गया: "
      & "{removed, number} हटाए गए} other {{field_name} "
      & "बदला गया: {removed, number} हटाए गए, "
      & "{unchanged, number} अपरिवर्तित}}} other "
      & "{{unchanged, plural, =0 {{field_name} बदला गया: {added, "
      & "number} जोड़े गए, {removed, number} हटाए गए} "
      & "other {{field_name} बदला गया: {added, number} "
      & "जोड़े गए, {removed, number} हटाए गए, "
      & "{unchanged, number} अपरिवर्तित}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {कोई विरोध नहीं} other "
      & "{{count, number} विरोध}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} को {old_label} से "
      & "आगे खिसकाकर {new_label} किया गया} "
      & "other {{field_name} को {old_label} से पहले "
      & "खिसकाकर {new_label} किया गया}}");
   P ("label.changes.duration_field_change_label",
      "{field_name} {old_label} से बदलकर {new_label} "
      & "किया गया");
   P ("label.changes.field_change_label",
      "{field_name} {old_value} से बदलकर {new_value} "
      & "किया गया");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name} जोड़ा गया} "
      & "removed_change {{name} हटाया गया} modified_change "
      & "{{name} बदला गया} renamed_change {{name} का "
      & "नाम बदला गया} unchanged_change {{name} "
      & "अपरिवर्तित} metadata_change {{name}: "
      & "मेटाडेटा बदला गया} moved_change {{name} "
      & "स्थानांतरित} conflict_change {{name}: "
      & "विरोध} other {{name}: अज्ञात "
      & "परिवर्तन}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {केवल मेटाडेटा "
      & "बदला} one {केवल 1 मेटाडेटा "
      & "फ़ील्ड बदला} other {केवल {count, number} "
      & "मेटाडेटा फ़ील्ड बदले}}");
   P ("label.changes.move_label",
      "{name} को {from} से {to} में ले जाया "
      & "गया");
   P ("label.changes.no_changes_label", "कोई परिवर्तन नहीं");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {किसी "
      & "पंक्ति में परिवर्तन नहीं} =1 "
      & "{1 पंक्ति जोड़ी गई} other {{lines_added, "
      & "number} पंक्तियाँ जोड़ी गईं}}} other "
      & "{{lines_added, plural, =0 {} =1 {1 पंक्ति जोड़ी "
      & "गई, } other {{lines_added, number} पंक्तियाँ "
      & "जोड़ी गईं, }}{lines_removed, plural, =1 {1 "
      & "पंक्ति हटाई गई} other {{lines_removed, number} "
      & "पंक्तियाँ हटाई गईं}}}}");
   P ("label.changes.rename_label",
      "नाम {old_name} से बदलकर {new_name} किया "
      & "गया");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} ने टिप्पणी "
      & "का ड्राफ़्ट बनाया} published_comment "
      & "{{author} ने टिप्पणी की} edited_comment "
      & "{{author} ने टिप्पणी संपादित की} "
      & "deleted_comment {{author} ने टिप्पणी हटाई} "
      & "resolved_comment {{author} ने टिप्पणी हल की} "
      & "unresolved_comment {{author} ने टिप्पणी फिर "
      & "से खोली} pinned_comment {{author} ने "
      & "टिप्पणी पिन की} other {{author} ने "
      & "टिप्पणी छिपाई}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {कोई टिप्पणी नहीं} =1 "
      & "{1 टिप्पणी} other {{count, number} "
      & "टिप्पणियाँ}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author} की "
      & "ड्राफ़्ट टिप्पणी} published_comment "
      & "{{author} की प्रकाशित टिप्पणी} "
      & "edited_comment {{author} की संपादित "
      & "टिप्पणी} deleted_comment {{author} की हटाई "
      & "गई टिप्पणी} resolved_comment {{author} की हल "
      & "की गई टिप्पणी} unresolved_comment {{author} "
      & "की अनसुलझी टिप्पणी} pinned_comment "
      & "{{author} की पिन की गई टिप्पणी} other "
      & "{{author} की छिपाई गई टिप्पणी}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {ड्राफ़्ट "
      & "टिप्पणी} published_comment {प्रकाशित "
      & "टिप्पणी} edited_comment {संपादित "
      & "टिप्पणी} deleted_comment {हटाई गई "
      & "टिप्पणी} resolved_comment {हल की गई "
      & "टिप्पणी} unresolved_comment {अनसुलझी "
      & "टिप्पणी} pinned_comment {पिन की गई "
      & "टिप्पणी} other {छिपाई गई "
      & "टिप्पणी}}");
   P ("label.comments.deleted_label", "{author} ने टिप्पणी हटाई");
   P ("label.comments.edited_label", "संपादित {time_text}");
   P ("label.comments.hide_comment_label", "टिप्पणी छिपाएँ: {reason}");
   P ("label.comments.lock_thread_label", "{name} थ्रेड लॉक करें");
   P ("label.comments.mention_label", "{actor} ने {target} का उल्लेख किया");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {कोई प्रतिभागी "
      & "नहीं} other {{count, number} प्रतिभागी}}");
   P ("label.comments.pin_label", "{name} पिन करें");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {पसंद "
      & "प्रतिक्रिया} dislike_reaction "
      & "{नापसंद प्रतिक्रिया} heart_reaction "
      & "{दिल प्रतिक्रिया} laugh_reaction "
      & "{हँसी प्रतिक्रिया} confused_reaction "
      & "{उलझन प्रतिक्रिया} hooray_reaction "
      & "{जश्न प्रतिक्रिया} rocket_reaction "
      & "{रॉकेट प्रतिक्रिया} other "
      & "{आँखें प्रतिक्रिया}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {पसंद} dislike_reaction "
      & "{नापसंद} heart_reaction {दिल} laugh_reaction "
      & "{हँसी} confused_reaction {उलझन} hooray_reaction "
      & "{जश्न} rocket_reaction {रॉकेट} other "
      & "{आँखें}}: {count, plural, =0 {कोई नहीं} other "
      & "{{count, number}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {कोई जवाब नहीं} other "
      & "{{count, number} जवाब}}");
   P ("label.comments.resolved_label", "{name} हल किया गया");
   P ("label.comments.subscribe_label", "{name} की सदस्यता लें");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {कोई थ्रेड नहीं} other "
      & "{{count, number} थ्रेड}}");
   P ("label.comments.thread_label",
      "थ्रेड {name}: {state, select, open_thread {खुला} "
      & "resolved_thread {हल किया गया} locked_thread "
      & "{लॉक} other {संग्रहीत}}{count, plural, =0 {} =1 "
      & "{, 1 टिप्पणी} other {, {count, number} "
      & "टिप्पणियाँ}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {खुला थ्रेड} "
      & "resolved_thread {हल किया गया थ्रेड} "
      & "locked_thread {लॉक किया गया थ्रेड} other "
      & "{संग्रहीत थ्रेड}}");
   P ("label.comments.unpin_label", "{name} अनपिन करें");
   P ("label.comments.unsubscribe_label", "{name} की सदस्यता छोड़ें");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name}: सुधार} regressed {{name}: "
      & "गिरावट} unchanged {{name}: अपरिवर्तित} "
      & "within_tolerance {{name}: सहनसीमा के भीतर} "
      & "outside_tolerance {{name}: सहनसीमा से बाहर} "
      & "new_value {{name}: नया} removed_value {{name}: हटाया "
      & "गया} other {{name}: बेसलाइन उपलब्ध "
      & "नहीं}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {सुधार} regressed "
      & "{गिरावट} unchanged {अपरिवर्तित} "
      & "within_tolerance {सहनसीमा के भीतर} "
      & "outside_tolerance {सहनसीमा से बाहर} "
      & "new_value {नया} removed_value {हटाया गया} other "
      & "{बेसलाइन उपलब्ध नहीं}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name}: {difference_text} सुधार} "
      & "regressed {{name}: {difference_text} गिरावट} unchanged "
      & "{{name}: अपरिवर्तित, अंतर "
      & "{difference_text}} within_tolerance {{name}: सहनसीमा "
      & "के भीतर, अंतर {difference_text}} outside_tolerance "
      & "{{name}: सहनसीमा से बाहर, अंतर "
      & "{difference_text}} new_value {{name}: नया, अंतर "
      & "{difference_text}} removed_value {{name}: हटाया गया, "
      & "अंतर {difference_text}} other {{name}: बेसलाइन "
      & "उपलब्ध नहीं, अंतर {difference_text}}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name}: {difference_text} सुधार} "
      & "regressed {{name}: {difference_text} गिरावट} unchanged "
      & "{{name}: अपरिवर्तित, अंतर "
      & "{difference_text}} within_tolerance {{name}: सहनसीमा "
      & "के भीतर, अंतर {difference_text}} outside_tolerance "
      & "{{name}: सहनसीमा से बाहर, अंतर "
      & "{difference_text}} new_value {{name}: नया, अंतर "
      & "{difference_text}} removed_value {{name}: हटाया गया, "
      & "अंतर {difference_text}} other {{name}: बेसलाइन "
      & "उपलब्ध नहीं, अंतर {difference_text}}}, "
      & "सहनसीमा {tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {अमान्य पंक्ति} "
      & "duplicate_record {डुप्लिकेट रिकॉर्ड} "
      & "missing_column {गायब कॉलम} unknown_field "
      & "{अज्ञात फ़ील्ड} schema_mismatch "
      & "{स्कीमा बेमेल} other {छोड़ा गया "
      & "रिकॉर्ड}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {ड्राई रन सफल} "
      & "dry_run_failed {ड्राई रन विफल} import_valid "
      & "{आयात मान्य} import_invalid {आयात "
      & "अमान्य} other {आंशिक आयात}}");
   P ("label.data_quality.import_result_label",
      "{name} – {state, select, dry_run_passed {ड्राई रन "
      & "सफल} dry_run_failed {ड्राई रन विफल} "
      & "import_valid {आयात मान्य} import_invalid "
      & "{आयात अमान्य} other {आंशिक "
      & "आयात}}: {accepted, number} स्वीकृत, {rejected, "
      & "number} अस्वीकृत");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {कोई "
      & "अमान्य पंक्ति नहीं} =1 {1 "
      & "अमान्य पंक्ति} other {{count, number} "
      & "अमान्य पंक्तियाँ}}} duplicate_record "
      & "{{count, plural, =0 {कोई डुप्लिकेट "
      & "रिकॉर्ड नहीं} other {{count, number} "
      & "डुप्लिकेट रिकॉर्ड}}} missing_column "
      & "{{count, plural, =0 {कोई गायब कॉलम नहीं} "
      & "other {{count, number} गायब कॉलम}}} unknown_field "
      & "{{count, plural, =0 {कोई अज्ञात फ़ील्ड "
      & "नहीं} other {{count, number} अज्ञात "
      & "फ़ील्ड}}} schema_mismatch {{count, plural, =0 {कोई "
      & "स्कीमा बेमेल नहीं} other {{count, "
      & "number} स्कीमा बेमेल}}} other {{count, plural, "
      & "=0 {कोई रिकॉर्ड छोड़ा नहीं "
      & "गया} =1 {1 छोड़ा गया रिकॉर्ड} "
      & "other {{count, number} छोड़े गए "
      & "रिकॉर्ड}}}}");
   P ("label.data_quality.row_issue_label",
      "पंक्ति {row, number}: {issue, select, invalid_row "
      & "{अमान्य पंक्ति} duplicate_record "
      & "{डुप्लिकेट रिकॉर्ड} missing_column "
      & "{गायब कॉलम} unknown_field {अज्ञात "
      & "फ़ील्ड} schema_mismatch {स्कीमा "
      & "बेमेल} other {छोड़ा गया "
      & "रिकॉर्ड}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {अमान्य "
      & "पंक्ति} duplicate_record {डुप्लिकेट "
      & "रिकॉर्ड} missing_column {गायब कॉलम} "
      & "unknown_field {अज्ञात फ़ील्ड} schema_mismatch "
      & "{स्कीमा बेमेल} other {छोड़ा गया "
      & "रिकॉर्ड}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {आर्टिफ़ैक्ट "
      & "तैयार} artifact_uploaded {आर्टिफ़ैक्ट "
      & "अपलोड हुआ} artifact_signed "
      & "{आर्टिफ़ैक्ट हस्ताक्षरित} "
      & "artifact_missing {आर्टिफ़ैक्ट "
      & "अनुपलब्ध} other {आर्टिफ़ैक्ट "
      & "की अवधि समाप्त}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {{name} का {environment} पर "
      & "डिप्लॉय कतार में} deploying {{name} "
      & "{environment} पर डिप्लॉय हो रहा है} "
      & "deployed {{name} {environment} पर डिप्लॉय हो "
      & "गया} failed_deployment {{name} का {environment} पर "
      & "डिप्लॉय विफल} rolled_back {{name} का "
      & "{environment} पर डिप्लॉय वापस लिया "
      & "गया} blocked_deployment {{name} का {environment} पर "
      & "डिप्लॉय अवरुद्ध} other {{name} का "
      & "{environment} पर डिप्लॉय रद्द}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {डिप्लॉय कतार "
      & "में} deploying {डिप्लॉय हो रहा है} "
      & "deployed {डिप्लॉय हो गया} failed_deployment "
      & "{डिप्लॉय विफल} rolled_back {वापस "
      & "लिया गया} blocked_deployment {डिप्लॉय "
      & "अवरुद्ध} other {डिप्लॉय रद्द}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {परिवेश "
      & "स्वस्थ} drifting_environment {परिवेश में "
      & "विचलन} locked_environment {परिवेश लॉक} "
      & "maintenance_environment {परिवेश रखरखाव "
      & "में} other {परिवेश की स्थिति "
      & "अज्ञात}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {कोई माइग्रेशन "
      & "नहीं} migration_pending {माइग्रेशन "
      & "लंबित} migrating {माइग्रेशन हो "
      & "रहा है} migration_complete {माइग्रेशन "
      & "पूरा} other {माइग्रेशन विफल}}");
   P ("label.deployments.promotion_label",
      "{name} को {from_environment} से {to_environment} पर "
      & "प्रमोट किया गया");
   P ("label.deployments.rollback_label", "{name} का {target} पर रोलबैक");
   P ("label.deployments.rollout_label", "{name} रोलआउट: {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {कोई प्रभावित आइटम "
      & "नहीं} one {1 प्रभावित आइटम} other "
      & "{{count, number} प्रभावित आइटम}}");
   P ("label.diagnostics.check_duration_label",
      "{status, select, passed_check {{name}: {duration_s, plural, one {1 "
      & "सेकंड} other {{duration_s, number} सेकंड}} "
      & "में सफल} failed_check {{name}: {duration_s, plural, one {1 "
      & "सेकंड} other {{duration_s, number} सेकंड}} "
      & "में विफल} warning_check {{name}: {duration_s, plural, "
      & "one {1 सेकंड} other {{duration_s, number} सेकंड}} "
      & "में चेतावनियाँ} skipped_check {{name}: "
      & "{duration_s, plural, one {1 सेकंड} other {{duration_s, "
      & "number} सेकंड}} में छोड़ा गया} "
      & "pending_check {{name}: {duration_s, plural, one {1 सेकंड} "
      & "other {{duration_s, number} सेकंड}} में "
      & "लंबित} other {{name}: {duration_s, plural, one {1 "
      & "सेकंड} other {{duration_s, number} सेकंड}} "
      & "में चल रहा है}}");
   P ("label.diagnostics.check_result_label",
      "{status, select, passed_check {{name}: सफल} failed_check "
      & "{{name}: विफल} warning_check {{name}: "
      & "चेतावनियाँ} skipped_check {{name}: छोड़ा "
      & "गया} pending_check {{name}: लंबित} other {{name}: "
      & "चल रहा है}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {सफल} failed_check {विफल} "
      & "warning_check {चेतावनियाँ} skipped_check "
      & "{छोड़ा गया} pending_check {लंबित} other "
      & "{चल रहा है}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {{subject} के लिए मान "
      & "अपेक्षित{position, plural, =0 {} other { "
      & "(स्थिति {position, number})}}; {suggestion} का "
      & "उपयोग करें} expected_unit {{subject} के "
      & "लिए इकाई अपेक्षित{position, plural, =0 "
      & "{} other { (स्थिति {position, number})}}; {suggestion} "
      & "का उपयोग करें} invalid_range {{subject} के "
      & "लिए अमान्य सीमा{position, plural, =0 {} "
      & "other { (स्थिति {position, number})}}; {suggestion} का "
      & "उपयोग करें} end_before_start {{subject} में "
      & "सीमा का अंत प्रारंभ से "
      & "पहले है{position, plural, =0 {} other { "
      & "(स्थिति {position, number})}}; {suggestion} का "
      & "उपयोग करें} unknown_field {{subject} के "
      & "लिए अज्ञात फ़ील्ड{position, plural, =0 "
      & "{} other { (स्थिति {position, number})}}; {suggestion} "
      & "का उपयोग करें} unsafe_redacted_value {{subject} "
      & "का असुरक्षित मान छिपाया "
      & "गया{position, plural, =0 {} other { (स्थिति "
      & "{position, number})}}; {suggestion} का उपयोग "
      & "करें} unsupported_syntax {{subject} के लिए "
      & "असमर्थित सिंटैक्स{position, plural, =0 "
      & "{} other { (स्थिति {position, number})}}; {suggestion} "
      & "का उपयोग करें} other {{subject} के लिए "
      & "निदान विवरण{position, plural, =0 {} other { "
      & "(स्थिति {position, number})}}; {suggestion} का "
      & "उपयोग करें}}");
   P ("label.diagnostics.diagnostic_label",
      "{path}{line, plural, =0 {} other {, पंक्ति {line, "
      & "number}}} में {severity, select, info_severity "
      & "{जानकारी} notice_severity {सूचना} "
      & "warning_severity {चेतावनी} error_severity "
      & "{त्रुटि} critical_severity {गंभीर} other "
      & "{अवरोधक}}: {message}");
   P ("label.diagnostics.failed_at_label",
      "{path}{line, plural, =0 {} other {, पंक्ति {line, "
      & "number}{column, plural, =0 {} other {, स्तंभ {column, "
      & "number}}}}} पर विफल");
   P ("label.diagnostics.field_problem_label",
      "{field_name} में {severity, select, info_severity "
      & "{जानकारी} notice_severity {सूचना} "
      & "warning_severity {चेतावनी} error_severity "
      & "{त्रुटि} critical_severity {गंभीर} other "
      & "{अवरोधक}}: {message}");
   P ("label.diagnostics.first_failure_label",
      "{check_name} में पहली विफलता: {path}{line, "
      & "plural, =0 {} other {, पंक्ति {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{कोई समस्या नहीं} other {{notices, plural, "
      & "one {1 सूचना} other {{notices, number} "
      & "सूचनाएँ}}}}} other {{notices, plural, =0 {{warnings, "
      & "plural, one {1 चेतावनी} other {{warnings, number} "
      & "चेतावनियाँ}}} other {{warnings, plural, one {1 "
      & "चेतावनी} other {{warnings, number} "
      & "चेतावनियाँ}}, {notices, plural, one {1 "
      & "सूचना} other {{notices, number} सूचनाएँ}}}}}}} "
      & "other {{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, "
      & "one {1 त्रुटि} other {{errors, number} "
      & "त्रुटियाँ}}} other {{errors, plural, one {1 "
      & "त्रुटि} other {{errors, number} "
      & "त्रुटियाँ}}, {notices, plural, one {1 "
      & "सूचना} other {{notices, number} सूचनाएँ}}}}} "
      & "other {{notices, plural, =0 {{errors, plural, one {1 "
      & "त्रुटि} other {{errors, number} "
      & "त्रुटियाँ}}, {warnings, plural, one {1 "
      & "चेतावनी} other {{warnings, number} "
      & "चेतावनियाँ}}} other {{errors, plural, one {1 "
      & "त्रुटि} other {{errors, number} "
      & "त्रुटियाँ}}, {warnings, plural, one {1 "
      & "चेतावनी} other {{warnings, number} "
      & "चेतावनियाँ}}, {notices, plural, one {1 "
      & "सूचना} other {{notices, number} "
      & "सूचनाएँ}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{path}{line, plural, =0 {} other {, पंक्ति {line, "
      & "number}{column, plural, =0 {} other {, स्तंभ {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{family, select, byte_parser {बाइट पार्सर के "
      & "लिए असमर्थित सिंटैक्स "
      & "{error}{position, plural, =0 {} other { (स्थिति {position, "
      & "number})}}; B, kB, MB, GB, KiB, MiB, GiB या TiB का "
      & "उपयोग करें} duration_parser {अवधि "
      & "पार्सर के लिए असमर्थित "
      & "सिंटैक्स {error}{position, plural, =0 {} other { "
      & "(स्थिति {position, number})}}; ms, s, min, h, d, w, month "
      & "या year का उपयोग करें} date_time_parser "
      & "{दिनांक-समय पार्सर के लिए "
      & "असमर्थित सिंटैक्स {error}{position, "
      & "plural, =0 {} other { (स्थिति {position, number})}}; ISO "
      & "दिनांक, सामान्य भाषा में "
      & "दिन या घड़ी का समय का उपयोग "
      & "करें} color_parser {रंग पार्सर के "
      & "लिए असमर्थित सिंटैक्स "
      & "{error}{position, plural, =0 {} other { (स्थिति {position, "
      & "number})}}; hex, rgb(), hsl(), lab(), lch() या रंग के "
      & "नाम का उपयोग करें} url_parser {URL "
      & "पार्सर के लिए असमर्थित "
      & "सिंटैक्स {error}{position, plural, =0 {} other { "
      & "(स्थिति {position, number})}}; स्कीम, "
      & "होस्ट, पाथ, क्वेरी या "
      & "फ़्रैगमेंट का उपयोग करें} "
      & "unit_parser {इकाई पार्सर के लिए "
      & "असमर्थित सिंटैक्स {error}{position, "
      & "plural, =0 {} other { (स्थिति {position, number})}}; "
      & "Humanize द्वारा समर्थित इकाई "
      & "लेबल का उपयोग करें} recurrence_parser "
      & "{पुनरावृत्ति पार्सर के लिए "
      & "असमर्थित सिंटैक्स {error}{position, "
      & "plural, =0 {} other { (स्थिति {position, number})}}; cron "
      & "या every/weekday पुनरावृत्ति रूप "
      & "का उपयोग करें} domain_label_parser "
      & "{डोमेन-लेबल पार्सर के लिए "
      & "असमर्थित सिंटैक्स {error}{position, "
      & "plural, =0 {} other { (स्थिति {position, number})}}; "
      & "निर्धारित Humanize डोमेन लेबल "
      & "का उपयोग करें} other {पार्सर के "
      & "लिए असमर्थित सिंटैक्स "
      & "{error}{position, plural, =0 {} other { (स्थिति {position, "
      & "number})}}; समर्थित इनपुट रूप का "
      & "उपयोग करें}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {सफल} failed_check {विफल} "
      & "warning_check {चेतावनियाँ} skipped_check "
      & "{छोड़ा गया} pending_check {लंबित} other "
      & "{चल रहा है}}{notices, plural, =0 {, कोई "
      & "सूचना नहीं} one {, 1 सूचना} other {, "
      & "{notices, number} सूचनाएँ}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {पुनः "
      & "प्रयास 1 में से 1} other {पुनः "
      & "प्रयास की सीमा पार (1 में से "
      & "{attempt, number})}}} other {पुनः प्रयास {limit, "
      & "number} में से {attempt, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {जानकारी} "
      & "notice_severity {सूचना} warning_severity "
      & "{चेतावनी} error_severity {त्रुटि} "
      & "critical_severity {गंभीर} other {अवरोधक}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {बिल्ड निदान} "
      & "test_source {परीक्षण निदान} lint_source "
      & "{लिंट निदान} import_source {आयात "
      & "निदान} validation_source {सत्यापन "
      & "निदान} runtime_source {रनटाइम निदान} "
      & "security_source {सुरक्षा निदान} other "
      & "{निदान}}");
   P ("label.diagnostics.source_summary_label",
      "{count, number} {source, select, build_source {बिल्ड "
      & "निदान} test_source {परीक्षण निदान} "
      & "lint_source {लिंट निदान} import_source {आयात "
      & "निदान} validation_source {सत्यापन "
      & "निदान} runtime_source {रनटाइम निदान} "
      & "security_source {सुरक्षा निदान} other "
      & "{निदान}}");
   P ("label.diagnostics.suggested_action_label", "आगे: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {डोमेन होस्ट} ipv4_host "
      & "{IPv4 पता} ipv6_host {IPv6 पता} localhost_host "
      & "{लोकल होस्ट} private_network_host {निजी "
      & "नेटवर्क पता} other {अज्ञात "
      & "होस्ट}}");
   P ("label.events.all_day_label", "{name} (पूरे दिन का कार्यक्रम)");
end Labels_1;
