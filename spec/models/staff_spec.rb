require 'rails_helper'
RSpec.describe Staff, type: :model do
  before do
    @staff = FactoryBot.build(:staff)
  end

  describe 'staff新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname,email,password,password_confirmationが存在すれば登録できる' do
        expect(@staff).to be_valid
      end
      it 'passwordが6文字以上で半角英数混合あれば登録できる' do
        @staff.password = '0000aa'
        @staff.password_confirmation = '0000aa'
        expect(@staff).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @staff.nickname = ''
        @staff.valid?
        expect(@staff.errors.full_messages).to include 'ニックネームを入力してください'
      end
      it 'emailが空では登録できない' do
        @staff.email = ''
        @staff.valid?
        expect(@staff.errors.full_messages).to include 'Eメールを入力してください'
      end
      it 'emailが登録済みの場合登録できない' do
        @staff.save
        another_staff = FactoryBot.build(:staff)
        another_staff.email = @staff.email
        another_staff.valid?
        expect(another_staff.errors.full_messages).to include 'Eメールはすでに存在します'
      end
      it 'emailに@が含まれていない場合登録できない' do
        @staff.email = '@'
        @staff.valid?
        expect(@staff.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'passwordが空では登録できない' do
        @staff.password = ''
        @staff.valid?
        expect(@staff.errors.full_messages).to include 'パスワードを入力してください'
      end
      it 'passwordが5文字以下であれば登録できない' do
        @staff.password = '000aa'
        @staff.password_confirmation = '000aa'
        @staff.valid?
        expect(@staff.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @staff.password_confirmation = ''
        @staff.valid?
        expect(@staff.errors.full_messages).to include 'Password confirmationとパスワードの入力が一致しません'
      end
      it 'passwordとpassword_confirmationが一致しない場合登録できない' do
        @staff.password = '0000aaa'
        @staff.password_confirmation = '0000bbb'
        @staff.valid?
        expect(@staff.errors.full_messages).to include 'Password confirmationとパスワードの入力が一致しません'
      end
      it 'passwordが半角英字のみの場合登録できない' do
        @staff.password = 'aaaaaaa'
        @staff.valid?
        expect(@staff.errors.full_messages).to include 'パスワードは半角英文字で入力してください'
      end
      it 'passwordが半角数字のみの場合登録できない' do
        @staff.password = '1111111'
        @staff.valid?
        expect(@staff.errors.full_messages).to include 'パスワードは半角英文字で入力してください'
      end
      it 'passwordが全角英数字の場合登録できない' do
        @staff.password = 'ａａａａ１１１'
        @staff.valid?
        expect(@staff.errors.full_messages).to include 'パスワードは半角英文字で入力してください'
      end
    end
  end
end
