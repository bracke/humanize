separate (Humanize.Catalogs.Phrase_Data.Locale_Hi)
procedure Labels_2 is
begin
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {जवाब नहीं दिया} "
      & "accepted {स्वीकार किया} declined "
      & "{अस्वीकार किया} maybe {शायद} other "
      & "{प्रतीक्षा सूची में}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {कोई प्रतिभागी "
      & "नहीं} one {1 प्रतिभागी} other {{count, "
      & "number} प्रतिभागी}}");
   P ("label.events.canceled_label", "{name} रद्द");
   P ("label.events.check_in_label", "{name} में चेक इन करें");
   P ("label.events.conference_link_label", "{name} कॉन्फ़्रेंस लिंक");
   P ("label.events.event_count_label",
      "{count, plural, =0 {कोई कार्यक्रम "
      & "नहीं} one {1 कार्यक्रम} other {{count, "
      & "number} कार्यक्रम}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {निर्धारित "
      & "कार्यक्रम} tentative_event {अस्थायी "
      & "कार्यक्रम} in_progress_event {जारी "
      & "कार्यक्रम} completed_event {पूर्ण "
      & "कार्यक्रम} canceled_event {रद्द "
      & "कार्यक्रम} other {स्थगित "
      & "कार्यक्रम}}");
   P ("label.events.event_location_label", "{name}, {location} में");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {निर्धारित "
      & "कार्यक्रम} tentative_event {अस्थायी "
      & "कार्यक्रम} in_progress_event {जारी "
      & "कार्यक्रम} completed_event {पूर्ण "
      & "कार्यक्रम} canceled_event {रद्द "
      & "कार्यक्रम} other {स्थगित "
      & "कार्यक्रम}}");
   P ("label.events.event_time_label", "{name}, {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {सार्वजनिक "
      & "कार्यक्रम} private_event {निजी "
      & "कार्यक्रम} busy_event {व्यस्त} other "
      & "{उपलब्ध}}");
   P ("label.events.organizer_label", "आयोजक: {name}");
   P ("label.events.rsvp_label",
      "RSVP: {state, select, not_responded {जवाब नहीं "
      & "दिया} accepted {स्वीकार किया} declined "
      & "{अस्वीकार किया} maybe {शायद} other "
      & "{प्रतीक्षा सूची में}}");
   P ("label.events.reminder_label", "रिमाइंडर {time_text}");
   P ("label.events.rescheduled_label",
      "{name} को {time_text} पर "
      & "पुनर्निर्धारित किया गया");
   P ("label.forms.character_count_label",
      "{used, plural, one {1 वर्ण} other {{used, number} "
      & "वर्ण}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {कोई वर्ण सीमा नहीं} "
      & "one {अधिकतम 1 वर्ण} other {अधिकतम "
      & "{limit, number} वर्ण}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, number} वर्ण} other {{limit, "
      & "number} में से {used, number} वर्ण}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}: वैकल्पिक "
      & "फ़ील्ड} other {{name}: आवश्यक "
      & "फ़ील्ड}}");
   P ("label.forms.field_state_label",
      "{state, select, valid_input {{name}: मान्य} invalid_input "
      & "{{name}: अमान्य} required_input {{name}: "
      & "आवश्यक} optional_input {{name}: वैकल्पिक} "
      & "disabled_input {{name}: अक्षम} other {{name}: केवल "
      & "पढ़ने योग्य}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {फ़ॉर्म "
      & "में कोई समस्या नहीं} other {{warnings, "
      & "plural, one {1 चेतावनी} other {{warnings, number} "
      & "चेतावनियाँ}}}}} other {{warnings, plural, =0 "
      & "{{errors, plural, one {1 त्रुटि} other {{errors, number} "
      & "त्रुटियाँ}}} other {{errors, plural, one {1 "
      & "त्रुटि} other {{errors, number} "
      & "त्रुटियाँ}}, {warnings, plural, one {1 "
      & "चेतावनी} other {{warnings, number} "
      & "चेतावनियाँ}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {शुरू नहीं हुआ} "
      & "editing_form {संपादन जारी} dirty_form "
      & "{बिना सहेजे बदलाव} saving_form "
      & "{सहेजा जा रहा है} saved_form {सहेजा "
      & "गया} submitted_form {सबमिट किया गया} "
      & "other {सबमिट करना विफल}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {मान्य इनपुट} "
      & "invalid_input {अमान्य इनपुट} required_input "
      & "{आवश्यक इनपुट} optional_input "
      & "{वैकल्पिक इनपुट} disabled_input "
      & "{अक्षम इनपुट} other {केवल पढ़ने "
      & "योग्य इनपुट}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {शुरू नहीं हुआ} "
      & "editing_form {संपादन जारी} dirty_form "
      & "{बिना सहेजे बदलाव} saving_form "
      & "{फ़ॉर्म सहेजा जा रहा है} "
      & "saved_form {फ़ॉर्म सहेजा गया} "
      & "submitted_form {फ़ॉर्म सबमिट किया "
      & "गया} other {{errors, plural, =0 {सबमिट करना "
      & "विफल} one {सबमिट करना विफल, 1 "
      & "त्रुटि} other {सबमिट करना विफल, "
      & "{errors, number} त्रुटियाँ}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {कोई बिना सहेजा "
      & "बदलाव नहीं} one {1 बिना सहेजा "
      & "बदलाव} other {{count, number} बिना सहेजे "
      & "बदलाव}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {सुलभ "
      & "नाम अनुपलब्ध} low_contrast {कम "
      & "कंट्रास्ट} skipped_heading_level {हेडिंग "
      & "स्तर छोड़ा गया} missing_form_label "
      & "{फ़ॉर्म लेबल अनुपलब्ध} "
      & "invalid_aria {अमान्य ARIA} keyboard_trap "
      & "{कीबोर्ड ट्रैप} other {अज्ञात "
      & "सुलभता समस्या}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title} सुलभता सारांश: {landmarks, plural, one "
      & "{1 लैंडमार्क} other {{landmarks, number} "
      & "लैंडमार्क}}, {headings, plural, one {1 "
      & "शीर्षक} other {{headings, number} शीर्षक}}, "
      & "{issues, plural, one {1 समस्या} other {{issues, number} "
      & "समस्याएँ}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {सुलभ नाम "
      & "जोड़ें} low_contrast {टेक्स्ट "
      & "कंट्रास्ट बढ़ाएँ} skipped_heading_level "
      & "{क्रमिक हेडिंग स्तरों का "
      & "उपयोग करें} missing_form_label {फ़ॉर्म "
      & "नियंत्रण के साथ लेबल "
      & "जोड़ें} invalid_aria {मान्य ARIA "
      & "भूमिका या एट्रिब्यूट का "
      & "उपयोग करें} keyboard_trap "
      & "{सुनिश्चित करें कि कीबोर्ड "
      & "फ़ोकस घटक से बाहर जा सके} other "
      & "{सुलभता समस्या की समीक्षा "
      & "करें}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target} में कोई सुलभता "
      & "समस्या नहीं है} one {{target} में 1 "
      & "सुलभता समस्या है} other {{target} "
      & "में {issues, number} सुलभता समस्याएँ "
      & "हैं}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id एट्रिब्यूट} "
      & "class_attribute {class एट्रिब्यूट} data_attribute "
      & "{डेटा एट्रिब्यूट} aria_attribute {ARIA "
      & "एट्रिब्यूट} role_attribute {role "
      & "एट्रिब्यूट} link_attribute {लिंक "
      & "एट्रिब्यूट} media_attribute {मीडिया "
      & "एट्रिब्यूट} form_attribute {फ़ॉर्म "
      & "एट्रिब्यूट} boolean_attribute {बूलियन "
      & "एट्रिब्यूट} event_attribute {इवेंट "
      & "हैंडलर एट्रिब्यूट} other "
      & "{अज्ञात एट्रिब्यूट}}");
   P ("label.markup.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{form_name} में "
      & "कोई समस्या नहीं} other {{form_name}: "
      & "{warnings, plural, one {1 चेतावनी} other {{warnings, "
      & "number} चेतावनियाँ}}}}} other {{warnings, plural, "
      & "=0 {{form_name}: {errors, plural, one {1 त्रुटि} other "
      & "{{errors, number} त्रुटियाँ}}} other {{form_name}: "
      & "{errors, plural, one {1 त्रुटि} other {{errors, number} "
      & "त्रुटियाँ}}, {warnings, plural, one {1 "
      & "चेतावनी} other {{warnings, number} "
      & "चेतावनियाँ}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {बैनर लैंडमार्क} "
      & "navigation_role {नेविगेशन लैंडमार्क} "
      & "main_role {मुख्य लैंडमार्क} "
      & "complementary_role {पूरक लैंडमार्क} "
      & "contentinfo_role {सामग्री जानकारी "
      & "लैंडमार्क} search_role {खोज "
      & "लैंडमार्क} form_role {फ़ॉर्म "
      & "लैंडमार्क} region_role {क्षेत्र "
      & "लैंडमार्क} dialog_role {संवाद} alert_role "
      & "{अलर्ट लाइव क्षेत्र} status_role "
      & "{स्थिति लाइव क्षेत्र} other "
      & "{अज्ञात लैंडमार्क}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region} तत्काल अपडेट: "
      & "{update}} other {{region} सामान्य अपडेट: "
      & "{update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {टेक्स्ट "
      & "सामग्री} html_content {HTML सामग्री} "
      & "json_content {JSON सामग्री} xml_content {XML "
      & "सामग्री} image_content {छवि सामग्री} "
      & "audio_content {ऑडियो सामग्री} video_content "
      & "{वीडियो सामग्री} font_content "
      & "{फ़ॉन्ट सामग्री} archive_content "
      & "{आर्काइव सामग्री} binary_content "
      & "{बाइनरी सामग्री} form_content "
      & "{फ़ॉर्म सामग्री} other {अज्ञात "
      & "सामग्री}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {दस्तावेज़ टैग} "
      & "metadata_tag {मेटाडेटा टैग} section_tag "
      & "{अनुभाग टैग} text_tag {टेक्स्ट "
      & "टैग} link_tag {लिंक टैग} media_tag "
      & "{मीडिया टैग} form_tag {फ़ॉर्म टैग} "
      & "table_tag {तालिका टैग} interactive_tag "
      & "{इंटरैक्टिव टैग} scripting_tag "
      & "{स्क्रिप्टिंग टैग} other "
      & "{अज्ञात टैग}}");
   P ("label.media.duration_label", "अवधि {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {छवि} video_media "
      & "{वीडियो} audio_media {ऑडियो} pdf_document {PDF "
      & "दस्तावेज़} text_document {टेक्स्ट "
      & "दस्तावेज़} archive_media {आर्काइव} "
      & "other {मीडिया}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {तैयार} processing_media "
      & "{प्रोसेस हो रहा है} transcoding_media "
      & "{ट्रांसकोड हो रहा है} "
      & "thumbnail_missing {थंबनेल उपलब्ध नहीं} "
      & "metadata_missing {मेटाडेटा अनुपलब्ध} "
      & "locked_document {दस्तावेज़ लॉक है} other "
      & "{उपलब्ध नहीं}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {छवि} video_media "
      & "{वीडियो} audio_media {ऑडियो} pdf_document {PDF "
      & "दस्तावेज़} text_document {टेक्स्ट "
      & "दस्तावेज़} archive_media {आर्काइव} "
      & "other {मीडिया}}): {state, select, ready_media "
      & "{तैयार} processing_media {प्रोसेस हो "
      & "रहा है} transcoding_media {ट्रांसकोड "
      & "हो रहा है} thumbnail_missing {थंबनेल "
      & "उपलब्ध नहीं} metadata_missing "
      & "{मेटाडेटा अनुपलब्ध} locked_document "
      & "{दस्तावेज़ लॉक है} other "
      & "{उपलब्ध नहीं}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {कोई पृष्ठ नहीं} one {1 "
      & "पृष्ठ} other {{pages, number} पृष्ठ}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "{item} की अपील: {state, select, open_report "
      & "{रिपोर्ट खुली है} triaged_report "
      & "{रिपोर्ट की जाँच हुई} actioned_report "
      & "{कार्रवाई की गई} dismissed_report "
      & "{रिपोर्ट ख़ारिज} appealed_report "
      & "{रिपोर्ट पर अपील की गई} other "
      & "{रिपोर्ट बंद}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {कोई मॉडरेशन "
      & "कार्रवाई नहीं} flagged {फ़्लैग "
      & "किया गया} hidden {मॉडरेटर "
      & "द्वारा छिपाया गया} restored "
      & "{पुनर्स्थापित} marked_spam {स्पैम "
      & "के रूप में चिह्नित} removed "
      & "{हटाया गया} other {एस्केलेट "
      & "किया गया}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {कोई मॉडरेशन "
      & "कार्रवाई नहीं} flagged {फ़्लैग "
      & "किया गया} hidden {मॉडरेटर "
      & "द्वारा छिपाया गया} restored "
      & "{पुनर्स्थापित} marked_spam {स्पैम "
      & "के रूप में चिह्नित} removed "
      & "{हटाया गया} other {एस्केलेट "
      & "किया गया}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {मॉडरेशन "
      & "कतार खाली} other {समीक्षा "
      & "लंबित: {pending, number}}}} other {समीक्षा "
      & "लंबित: {pending, number}, एस्केलेट: "
      & "{escalated, number}}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {खुली "
      & "रिपोर्ट} triaged_report {जाँची गई "
      & "रिपोर्ट} actioned_report {कार्रवाई "
      & "की गई} dismissed_report {ख़ारिज "
      & "रिपोर्ट} appealed_report {अपील की गई "
      & "रिपोर्ट} other {बंद रिपोर्ट}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {खुली रिपोर्ट} "
      & "triaged_report {जाँची गई रिपोर्ट} "
      & "actioned_report {कार्रवाई की गई} "
      & "dismissed_report {ख़ारिज रिपोर्ट} "
      & "appealed_report {अपील की गई रिपोर्ट} "
      & "other {बंद रिपोर्ट}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {समीक्षा "
      & "लंबित} approved {स्वीकृत} rejected "
      & "{अस्वीकृत} needs_changes {बदलाव "
      & "आवश्यक} other {समीक्षा "
      & "एस्केलेट की गई}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {समीक्षा लंबित} "
      & "approved {स्वीकृत} rejected {अस्वीकृत} "
      & "needs_changes {बदलाव आवश्यक} other "
      & "{समीक्षा एस्केलेट की गई}}");
   P ("label.navigation.back_label", "{target} पर वापस जाएँ");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {कोई ब्रेडक्रंब "
      & "नहीं} one {1 ब्रेडक्रंब} other {{depth, "
      & "number} ब्रेडक्रंब}}");
   P ("label.navigation.current_page_label", "वर्तमान पृष्ठ: {name}");
   P ("label.navigation.external_link_label", "{name} (बाहरी लिंक)");
   P ("label.navigation.first_label", "पहला: {target}");
   P ("label.navigation.last_label", "अंतिम: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {कोई मेनू आइटम नहीं} "
      & "one {1 मेनू आइटम} other {{count, number} मेनू "
      & "आइटम}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {लिंक} menu_item {मेनू "
      & "आइटम} tab_item {टैब} breadcrumb_item "
      & "{ब्रेडक्रंब} section_item {अनुभाग} "
      & "other {विभाजक}}");
   P ("label.navigation.navigation_item_label",
      "{name} {kind, select, link_item {लिंक} menu_item {मेनू "
      & "आइटम} tab_item {टैब} breadcrumb_item "
      & "{ब्रेडक्रंब} section_item {अनुभाग} "
      & "other {विभाजक}}: {state, select, current_item "
      & "{वर्तमान} active_item {सक्रिय} inactive_item "
      & "{निष्क्रिय} disabled_item {अक्षम} "
      & "expanded_item {विस्तारित} collapsed_item "
      & "{संक्षिप्त} visited_item {देखा गया} "
      & "other {बाहरी}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {वर्तमान} active_item "
      & "{सक्रिय} inactive_item {निष्क्रिय} "
      & "disabled_item {अक्षम} expanded_item "
      & "{विस्तारित} collapsed_item "
      & "{संक्षिप्त} visited_item {देखा गया} "
      & "other {बाहरी}}");
   P ("label.navigation.next_label", "अगला: {target}");
   P ("label.navigation.section_state_label",
      "अनुभाग {name} {expanded, select, false "
      & "{संक्षिप्त} other "
      & "{विस्तारित}}{count, plural, =0 {} one {, 1 "
      & "आइटम} other {, {count, number} आइटम}}");
   P ("label.navigation.skip_link_label", "{target} पर जाएँ");
   P ("label.navigation.submenu_label",
      "{name} उपमेनू, {count, plural, one {1 आइटम} other "
      & "{{count, number} आइटम}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {सभी अलर्ट} "
      & "important_alerts {महत्वपूर्ण अलर्ट} "
      & "critical_alerts_only {केवल गंभीर अलर्ट} "
      & "other {कोई अलर्ट नहीं}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel} सूचनाएँ: {state, select, preference_enabled "
      & "{सक्षम} preference_disabled {अक्षम} "
      & "preference_inherited {विरासत में मिली} other "
      & "{आवश्यक}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {कोई डाइजेस्ट "
      & "नहीं} instant_digest {तत्काल "
      & "डाइजेस्ट} daily_digest {दैनिक "
      & "डाइजेस्ट} other {साप्ताहिक "
      & "डाइजेस्ट}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {सक्षम} "
      & "preference_disabled {अक्षम} preference_inherited "
      & "{विरासत में मिला} other "
      & "{आवश्यक}}");
   P ("label.notification_preferences.quiet_hours_label", "शांत समय: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name} {scope, select, thread_subscription {थ्रेड "
      & "सदस्यता} project_subscription "
      & "{प्रोजेक्ट सदस्यता} team_subscription "
      & "{टीम सदस्यता} other {खाता "
      & "सदस्यता}}: {state, select, preference_enabled "
      & "{सक्षम} preference_disabled {अक्षम} "
      & "preference_inherited {विरासत में मिली} other "
      & "{आवश्यक}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {थ्रेड "
      & "सदस्यता} project_subscription "
      & "{प्रोजेक्ट सदस्यता} team_subscription "
      & "{टीम सदस्यता} other {खाता "
      & "सदस्यता}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} ने आपका "
      & "उल्लेख किया} reply_event {{actor} ने "
      & "जवाब दिया} assignment_event {{actor} ने "
      & "आपको असाइन किया} approval_event {{actor} "
      & "ने स्वीकृति माँगी} alert_event {{actor} "
      & "ने अलर्ट भेजा} digest_event {{actor} ने "
      & "डाइजेस्ट भेजा} reminder_event {{actor} ने "
      & "रिमाइंडर भेजा} other {{actor} ने "
      & "सिस्टम सूचना भेजी}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {इन-ऐप सूचना} "
      & "email_channel {ईमेल सूचना} sms_channel {SMS "
      & "सूचना} push_channel {पुश सूचना} "
      & "webhook_channel {वेबहुक सूचना} other "
      & "{डाइजेस्ट सूचना}}: {state, select, "
      & "pending_delivery {लंबित} sent_delivery {भेजी गई} "
      & "delivered_delivery {पहुँचाई गई} failed_delivery "
      & "{विफल} retrying_delivery {फिर से प्रयास "
      & "हो रहा है} other {रद्द}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {लंबित सूचना} "
      & "sent_delivery {भेजी गई सूचना} delivered_delivery "
      & "{पहुँचाई गई सूचना} failed_delivery "
      & "{विफल सूचना} retrying_delivery {सूचना "
      & "का पुनः प्रयास} other {रद्द "
      & "सूचना}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {लंबित {time_text}} "
      & "sent_delivery {भेजी गई {time_text}} delivered_delivery "
      & "{पहुँचाई गई {time_text}} failed_delivery "
      & "{विफल {time_text}} retrying_delivery {पुनः "
      & "प्रयास {time_text}} other {रद्द {time_text}}}");
   P ("label.notifications.digest_label",
      "{name} डाइजेस्ट: {count, plural, =0 {कोई "
      & "सूचना नहीं} one {1 सूचना} other {{count, "
      & "number} सूचनाएँ}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {कोई "
      & "उल्लेख नहीं} one {1 उल्लेख} other "
      & "{{count, number} उल्लेख}}} reply_event {{count, plural, =0 "
      & "{कोई जवाब नहीं} one {1 जवाब} other "
      & "{{count, number} जवाब}}} assignment_event {{count, plural, =0 "
      & "{कोई असाइनमेंट नहीं} one {1 "
      & "असाइनमेंट} other {{count, number} "
      & "असाइनमेंट}}} approval_event {{count, plural, =0 "
      & "{कोई स्वीकृति अनुरोध नहीं} "
      & "one {1 स्वीकृति अनुरोध} other {{count, "
      & "number} स्वीकृति अनुरोध}}} alert_event "
      & "{{count, plural, =0 {कोई अलर्ट नहीं} one {1 "
      & "अलर्ट} other {{count, number} अलर्ट}}} "
      & "digest_event {{count, plural, =0 {कोई डाइजेस्ट "
      & "नहीं} one {1 डाइजेस्ट} other {{count, number} "
      & "डाइजेस्ट}}} reminder_event {{count, plural, =0 "
      & "{कोई रिमाइंडर नहीं} one {1 "
      & "रिमाइंडर} other {{count, number} "
      & "रिमाइंडर}}} other {{count, plural, =0 {कोई "
      & "सिस्टम सूचना नहीं} one {1 "
      & "सिस्टम सूचना} other {{count, number} "
      & "सिस्टम सूचनाएँ}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {सूचना को पढ़ी गई के "
      & "रूप में चिह्नित करें} other {{count, "
      & "number} सूचनाओं को पढ़ी गई के "
      & "रूप में चिह्नित करें}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {सूचना को अपठित के "
      & "रूप में चिह्नित करें} other {{count, "
      & "number} सूचनाओं को अपठित के रूप "
      & "में चिह्नित करें}}");
   P ("label.notifications.muted_label", "{name} की सूचनाएँ म्यूट हैं");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {नया उल्लेख} "
      & "reply_event {नया जवाब} assignment_event {नया "
      & "असाइनमेंट} approval_event {नया "
      & "स्वीकृति अनुरोध} alert_event {नया "
      & "अलर्ट} digest_event {नया डाइजेस्ट} "
      & "reminder_event {नया रिमाइंडर} other {नई "
      & "सिस्टम सूचना}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {इन-ऐप सूचनाएँ} "
      & "email_channel {ईमेल सूचनाएँ} sms_channel {SMS "
      & "सूचनाएँ} push_channel {पुश सूचनाएँ} "
      & "webhook_channel {वेबहुक सूचनाएँ} other "
      & "{डाइजेस्ट सूचनाएँ}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {कोई सूचना नहीं} one {1 "
      & "सूचना} other {{count, number} सूचनाएँ}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {उल्लेख} reply_event "
      & "{जवाब} assignment_event {असाइनमेंट} "
      & "approval_event {स्वीकृति अनुरोध} "
      & "alert_event {अलर्ट} digest_event {डाइजेस्ट} "
      & "reminder_event {रिमाइंडर} other {सिस्टम "
      & "सूचना}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {कोई सूचना नहीं} "
      & "one {1 सूचना} other {{count, number} सूचनाएँ}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {उल्लेख} "
      & "reply_event {जवाब} assignment_event "
      & "{असाइनमेंट} approval_event {स्वीकृति "
      & "अनुरोध} alert_event {अलर्ट} digest_event "
      & "{डाइजेस्ट} reminder_event {रिमाइंडर} "
      & "other {सिस्टम सूचना}}, {state, select, "
      & "unread_state {अपठित} read_state {पठित} "
      & "archived_state {संग्रहीत} muted_state "
      & "{म्यूट} snoozed_state {स्नूज़} other "
      & "{अवरुद्ध}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {अपठित सूचना} "
      & "read_state {पठित सूचना} archived_state "
      & "{संग्रहीत सूचना} muted_state "
      & "{म्यूट सूचना} snoozed_state {स्नूज़ "
      & "की गई सूचना} other {अवरुद्ध "
      & "सूचना}}");
   P ("label.notifications.snoozed_label", "{name} की सूचनाएँ स्नूज़ हैं");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {कोई सूचना अवरुद्ध "
      & "नहीं} one {1 सूचना अवरुद्ध} other "
      & "{{count, number} सूचनाएँ अवरुद्ध}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {कोई अपठित सूचना "
      & "नहीं} one {1 अपठित सूचना} other {{count, "
      & "number} अपठित सूचनाएँ}}");
   P ("label.payments.amount_label", "राशि: {amount_text}");
   P ("label.payments.balance_label", "शेष राशि: {amount_text}");
   P ("label.payments.chargeback_label", "चार्जबैक: {amount_text}");
   P ("label.payments.discount_label", "छूट: {amount_text}");
   P ("label.payments.due_label", "{amount_text} देय {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {कोई चालान नहीं} one {1 "
      & "चालान} other {{count, number} चालान}}");
   P ("label.payments.invoice_label",
      "चालान {number}: {state, select, draft_invoice "
      & "{ड्राफ़्ट} open_invoice {खुला} paid_invoice "
      & "{भुगतान हो गया} overdue_invoice "
      & "{अतिदेय} other {रद्द}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {ड्राफ़्ट "
      & "चालान} open_invoice {खुला चालान} "
      & "paid_invoice {भुगतान किया गया "
      & "चालान} overdue_invoice {अतिदेय चालान} "
      & "other {रद्द चालान}}");
   P ("label.payments.method_label",
      "{method, select, card_method {कार्ड से "
      & "भुगतान} bank_transfer_method {बैंक "
      & "ट्रांसफ़र से भुगतान} cash_method "
      & "{नकद भुगतान} wallet_method {वॉलेट से "
      & "भुगतान} check_method {चेक से भुगतान} "
      & "other {अन्य तरीके से भुगतान}}: "
      & "{detail}");
   P ("label.payments.paid_label", "{amount_text} का भुगतान {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {कोई भुगतान नहीं} one {1 "
      & "भुगतान} other {{count, number} भुगतान}}");
   P ("label.payments.payment_label",
      "{amount_text}: {state, select, pending_payment {लंबित "
      & "भुगतान} authorized_payment {अधिकृत "
      & "भुगतान} paid_payment {पूर्ण भुगतान} "
      & "failed_payment {विफल भुगतान} refunded_payment "
      & "{वापस किया गया भुगतान} other "
      & "{रद्द भुगतान}}");
   P ("label.payments.payment_link_label", "{name} भुगतान लिंक");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {कार्ड} bank_transfer_method "
      & "{बैंक ट्रांसफ़र} cash_method {नकद} "
      & "wallet_method {वॉलेट} check_method {चेक} other "
      & "{अन्य}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {लंबित भुगतान} "
      & "authorized_payment {अधिकृत भुगतान} "
      & "paid_payment {पूर्ण भुगतान} failed_payment "
      & "{विफल भुगतान} refunded_payment {वापस "
      & "किया गया भुगतान} other {रद्द "
      & "भुगतान}}");
   P ("label.payments.receipt_label", "रसीद {number}");
   P ("label.payments.refund_label",
      "{amount_text}: {state, select, pending_payment {लंबित "
      & "रिफ़ंड} authorized_payment {अधिकृत "
      & "रिफ़ंड} paid_payment {पूर्ण रिफ़ंड} "
      & "failed_payment {विफल रिफ़ंड} refunded_payment "
      & "{रिफ़ंड हो गया} other {रद्द "
      & "रिफ़ंड}}");
   P ("label.payments.subtotal_label", "उप-योग: {amount_text}");
   P ("label.payments.tax_label", "कर: {amount_text}");
   P ("label.payments.total_label", "कुल: {amount_text}");
   P ("label.permissions.access_expiry_label",
      "{subject} की पहुँच {time_text} समाप्त "
      & "होगी");
   P ("label.permissions.grant_label",
      "{subject} को {role, select, owner_role {स्वामी} "
      & "admin_role {व्यवस्थापक} editor_role "
      & "{संपादक} viewer_role {दर्शक} other "
      & "{कस्टम}} भूमिका दी गई");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {स्वीकृत} "
      & "denied {अस्वीकृत} inherited {विरासत "
      & "में मिली} temporary {अस्थायी "
      & "पहुँच} expired {समाप्त} other "
      & "{स्वीकृति आवश्यक}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {स्वीकृत} denied "
      & "{अस्वीकृत} inherited {विरासत में "
      & "मिली} temporary {अस्थायी पहुँच} "
      & "expired {समाप्त} other {स्वीकृति "
      & "आवश्यक}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {नीति द्वारा "
      & "अनुमत} policy_denied {नीति द्वारा "
      & "अस्वीकृत} policy_warning {नीति "
      & "चेतावनी} other {नीति लागू नहीं}}");
   P ("label.permissions.revoke_label",
      "{subject} से {role, select, owner_role {स्वामी} "
      & "admin_role {व्यवस्थापक} editor_role "
      & "{संपादक} viewer_role {दर्शक} other "
      & "{कस्टम}} भूमिका वापस ली गई");
   P ("label.permissions.role_label",
      "{role, select, owner_role {स्वामी} admin_role "
      & "{व्यवस्थापक} editor_role {संपादक} "
      & "viewer_role {दर्शक} other {कस्टम "
      & "भूमिका}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {खाली} low_utilization "
      & "{कम उपयोग} normal_utilization {सामान्य "
      & "उपयोग} high_utilization {अधिक उपयोग} "
      & "critical_utilization {गंभीर उपयोग} "
      & "full_utilization {भरा हुआ} other {सीमा से "
      & "अधिक}}");
   P ("label.schema.array_shape_label",
      "{element_type, select, string_field {स्ट्रिंग} "
      & "integer_field {पूर्णांक} decimal_field "
      & "{दशमलव} boolean_field {बूलियन} date_field "
      & "{दिनांक} date_time_field {दिनांक-समय} "
      & "object_field {ऑब्जेक्ट} array_field {ऐरे} "
      & "enum_field {एनम} binary_field {बाइनरी} null_field "
      & "{null} any_field {किसी भी प्रकार} other "
      & "{अज्ञात प्रकार}} का ऐरे{count_known, "
      & "select, false {} other { ({count, plural, one {1 आइटम} other "
      & "{{count, number} आइटम}})}}");
   P ("label.schema.constraint_label", "बाधा {name}: {value}");
   P ("label.schema.default_value_label",
      "फ़ील्ड {field_name} का डिफ़ॉल्ट "
      & "मान: {value}");
   P ("label.schema.deprecated_field_label",
      "फ़ील्ड {name} अप्रचलित है, "
      & "{replacement} का उपयोग करें");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 एनम विकल्प} other {{count, "
      & "number} एनम विकल्प}}");
   P ("label.schema.example_value_label", "फ़ील्ड {field_name} का उदाहरण: {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {सामान्य "
      & "फ़ील्ड} deprecated_field {अप्रचलित "
      & "फ़ील्ड} unknown_field {अज्ञात "
      & "फ़ील्ड} read_only_field {केवल पढ़ने "
      & "योग्य फ़ील्ड} write_only_field {केवल "
      & "लिखने योग्य फ़ील्ड} other "
      & "{परिकलित फ़ील्ड}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {स्ट्रिंग "
      & "फ़ील्ड} integer_field {पूर्णांक "
      & "फ़ील्ड} decimal_field {दशमलव फ़ील्ड} "
      & "boolean_field {बूलियन फ़ील्ड} date_field "
      & "{दिनांक फ़ील्ड} date_time_field "
      & "{दिनांक-समय फ़ील्ड} object_field "
      & "{ऑब्जेक्ट फ़ील्ड} array_field {ऐरे "
      & "फ़ील्ड} enum_field {एनम फ़ील्ड} "
      & "binary_field {बाइनरी फ़ील्ड} null_field {null "
      & "फ़ील्ड} any_field {किसी भी प्रकार "
      & "का फ़ील्ड} other {अज्ञात "
      & "प्रकार का फ़ील्ड}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {कोई आवश्यक फ़ील्ड "
      & "अनुपस्थित नहीं} one {1 आवश्यक "
      & "फ़ील्ड अनुपस्थित} other {{count, number} "
      & "आवश्यक फ़ील्ड अनुपस्थित}}");
   P ("label.schema.object_shape_label",
      "{fields, plural, one {1 फ़ील्ड} other {{fields, number} "
      & "फ़ील्ड}} वाला ऑब्जेक्ट{required, "
      & "plural, =0 {} other {, {required, number} "
      & "आवश्यक}}{optional, plural, =0 {} other {, {optional, "
      & "number} वैकल्पिक}}");
   P ("label.schema.schema_source_label", "स्कीमा {name}, संस्करण {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {अदिश मान} object_shape "
      & "{{count, plural, =0 {ऑब्जेक्ट} one {1 "
      & "फ़ील्ड वाला ऑब्जेक्ट} other "
      & "{{count, number} फ़ील्ड वाला "
      & "ऑब्जेक्ट}}} array_shape {{count, plural, =0 "
      & "{ऐरे} one {1 आइटम वाला ऐरे} other {{count, "
      & "number} आइटम वाला ऐरे}}} map_shape {{count, "
      & "plural, =0 {मैप} one {1 प्रविष्टि वाला "
      & "मैप} other {{count, number} प्रविष्टियों "
      & "वाला मैप}}} tuple_shape {{count, plural, =0 {टपल} "
      & "one {1 आइटम वाला टपल} other {{count, number} "
      & "आइटम वाला टपल}}} union_shape {{count, plural, =0 "
      & "{यूनियन} one {1 प्रकार का "
      & "यूनियन} other {{count, number} प्रकारों "
      & "का यूनियन}}} empty_shape {खाली आकार} "
      & "other {अज्ञात आकार}}");
   P ("label.schema.unknown_field_label", "अज्ञात फ़ील्ड {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {कोई सक्रिय फ़िल्टर "
      & "नहीं} other {{count, number} सक्रिय "
      & "फ़िल्टर}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {फ़िल्टर साफ़ करें} "
      & "=1 {सक्रिय फ़िल्टर साफ़ "
      & "करें} other {{count, number} सक्रिय "
      & "फ़िल्टर साफ़ करें}}");
   P ("label.search.facet_label", "{name} फ़ैसेट, {count, number} विकल्प");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {कोई परिणाम नहीं} "
      & "other {{count, number} परिणाम}}{selected, select, true {, "
      & "चयनित} other {}}");
end Labels_2;
