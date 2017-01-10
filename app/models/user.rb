class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :purchased_stocks

  def serialize_portfolio
    self.to_json(
      :only => [:id, :first_name, :last_name],
      :include => [
        :purchased_stocks => { :methods => [
                                :cost_basis,
                                :ask,
                                :company_name,
                                :last_trade_date,
                                :last_trade_time,
                                :last_trade_price
                              ]
                            }
      ]
    )
  end

end
