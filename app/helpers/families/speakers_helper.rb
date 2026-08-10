module Families::SpeakersHelper
  def speaker_qrcode
    @qrcode_srv = RQRCode::QRCode.new(speaker_url(@speaker.slug)).as_svg.html_safe
  end
end
