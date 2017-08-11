class PosterPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    is_admin?
  end

  def show?
    is_admin?
  end

  def create?
    is_admin? || is_self?
  end

  def update?
    is_admin? || is_self?
  end

  def destroy?
    is_admin? || is_self?
  end

  def is_admin?
    @user.type == 'Admin'
  end

  def is_self?
    @user == @record
  end
end
