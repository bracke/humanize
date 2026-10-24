separate (Humanize.Catalogs.Phrase_Data.Locale_Es_419)
procedure Labels_1 is
begin
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {dispositivo de confianza} "
      & "untrusted_device {dispositivo no confiable} new_device {dispositivo "
      & "nuevo} other {dispositivo bloqueado}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {archivo adjunto} image_attachment "
      & "{imagen adjunta} video_attachment {video adjunto} audio_attachment "
      & "{audio adjunto} document_attachment {documento adjunto} "
      & "archive_attachment {archivo comprimido adjunto} other {enlace "
      & "adjunto}}");
   P ("label.attachments.attachment_label",
      "{name}: {kind, select, file_attachment {archivo} image_attachment "
      & "{imagen} video_attachment {video} audio_attachment {audio} "
      & "document_attachment {documento} archive_attachment {archivo "
      & "comprimido} other {enlace}} {state, select, pending_attachment "
      & "{pendiente} uploading_attachment {subiendo} uploaded_attachment "
      & "{{kind, select, image_attachment {subida} other {subido}}} "
      & "failed_attachment {con error} removed_attachment {{kind, select, "
      & "image_attachment {quitada} other {quitado}}} other {{kind, select, "
      & "image_attachment {bloqueada} other {bloqueado}}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {contenido de texto} html_content "
      & "{contenido HTML} json_content {contenido JSON} xml_content {contenido "
      & "XML} image_content {contenido de imagen} audio_content {contenido de "
      & "audio} video_content {contenido de video} font_content {contenido de "
      & "fuente} archive_content {contenido de archivo comprimido} "
      & "binary_content {contenido binario} form_content {contenido de "
      & "formulario} other {contenido desconocido}}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {imagen} video_media {video} audio_media "
      & "{audio} pdf_document {documento PDF} text_document {documento de "
      & "texto} archive_media {archivo comprimido} other {contenido "
      & "multimedia}}");
   P ("label.media.media_summary",
      "{name}: {kind, select, image_media {{state, select, ready_media "
      & "{imagen lista} processing_media {imagen en procesamiento} "
      & "transcoding_media {imagen en transcodificación} thumbnail_missing "
      & "{imagen, miniatura no disponible} metadata_missing {imagen, faltan "
      & "metadatos} locked_document {imagen bloqueada} other {imagen no "
      & "disponible}}} video_media {{state, select, ready_media {video listo} "
      & "processing_media {video en procesamiento} transcoding_media {video en "
      & "transcodificación} thumbnail_missing {video, miniatura no disponible} "
      & "metadata_missing {video, faltan metadatos} locked_document {video "
      & "bloqueado} other {video no disponible}}} audio_media {{state, select, "
      & "ready_media {audio listo} processing_media {audio en procesamiento} "
      & "transcoding_media {audio en transcodificación} thumbnail_missing "
      & "{audio, miniatura no disponible} metadata_missing {audio, faltan "
      & "metadatos} locked_document {audio bloqueado} other {audio no "
      & "disponible}}} pdf_document {{state, select, ready_media {documento PDF "
      & "listo} processing_media {documento PDF en procesamiento} "
      & "transcoding_media {documento PDF en transcodificación} "
      & "thumbnail_missing {documento PDF, miniatura no disponible} "
      & "metadata_missing {documento PDF, faltan metadatos} locked_document "
      & "{documento PDF bloqueado} other {documento PDF no disponible}}} "
      & "text_document {{state, select, ready_media {documento de texto listo} "
      & "processing_media {documento de texto en procesamiento} "
      & "transcoding_media {documento de texto en transcodificación} "
      & "thumbnail_missing {documento de texto, miniatura no disponible} "
      & "metadata_missing {documento de texto, faltan metadatos} "
      & "locked_document {documento de texto bloqueado} other {documento de "
      & "texto no disponible}}} archive_media {{state, select, ready_media "
      & "{archivo comprimido listo} processing_media {archivo comprimido en "
      & "procesamiento} transcoding_media {archivo comprimido en "
      & "transcodificación} thumbnail_missing {archivo comprimido, miniatura "
      & "no disponible} metadata_missing {archivo comprimido, faltan metadatos} "
      & "locked_document {archivo comprimido bloqueado} other {archivo "
      & "comprimido no disponible}}} other {{state, select, ready_media "
      & "{contenido multimedia listo} processing_media {contenido multimedia en "
      & "procesamiento} transcoding_media {contenido multimedia en "
      & "transcodificación} thumbnail_missing {contenido multimedia, miniatura "
      & "no disponible} metadata_missing {contenido multimedia, faltan "
      & "metadatos} locked_document {contenido multimedia bloqueado} other "
      & "{contenido multimedia no disponible}}}}");
   P ("label.payments.amount_label", "monto: {amount_text}");
   P ("label.payments.method_label",
      "{method, select, card_method {pagado con tarjeta: {detail}} "
      & "bank_transfer_method {pagado por transferencia bancaria: {detail}} "
      & "cash_method {pagado en efectivo: {detail}} wallet_method {pagado con "
      & "billetera electrónica: {detail}} check_method {pagado con cheque: "
      & "{detail}} other {pagado por otro medio: {detail}}}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {tarjeta} bank_transfer_method "
      & "{transferencia bancaria} cash_method {efectivo} wallet_method "
      & "{billetera electrónica} check_method {cheque} other {otro}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {sin lugares} one {{reserved, plural, =0 {0 de 1 "
      & "lugar reservado} other {1 de 1 lugar reservado}}} other {{reserved, "
      & "number} de {capacity, number} lugares reservados}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {contenido de texto} html_content "
      & "{documento HTML} json_content {documento JSON} xml_content {documento "
      & "XML} image_content {contenido de imagen} audio_content {contenido de "
      & "audio} video_content {contenido de video} font_content {contenido de "
      & "fuente} archive_content {contenido de archivo comprimido} "
      & "binary_content {contenido binario} form_content {envío de formulario} "
      & "other {contenido desconocido}} ({base})");
end Labels_1;
