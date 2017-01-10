class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :purchased_stocks

  # Returns an array of portfolio values of last year's data month by month
  def last_year_portfolio_performance

  end
end
