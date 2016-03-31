class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :users_roles
  has_many :roles, through: :users_roles
  has_one :profile
  accepts_nested_attributes_for :profile

  # Is_admin Action find whether the user holds the role as Admin
  def is_admin?

    status = false
    self.roles.each do|role_entry|
      if (role_entry.name == 'Admin')
        status = true
      end
    end
    return status
  end
  # Is_prospect Action find whether the user holds the role as Prospect
  def is_prospect?
    status = false
    self.roles.each do|role_entry|
      if (role_entry.name == 'Prospect')
        status = true
      end
    end
    return status
  end


  # after_create :set_default_role is used to set default role as Prospect
  after_create :set_default_role

    private
      def set_default_role
        @users = User.last
        @role = Role.where(name: 'Prospect').first
        UsersRole.create(	role_id: @role.id,
                            user_id: @users.id
        )
      end

  # after_create :set_default_role is used to set default role as Prospect
  #after_create :build_profile

    # protected
    #   def profile
    #     super || build_profile
    #   end


end
