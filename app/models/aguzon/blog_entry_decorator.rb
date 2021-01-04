Spree::BlogEntry.class_eval do
  def display_date
    if published_at.present?
      # 文字列に変換
      # 文頭から10文字目で切り取る
      # ハイフンをドットに変換
      published_at.to_s.slice(0..10).gsub(/-/, '.')
    end
  end
end
