def stub_facebook
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    privider: 'facebook',
    uid: '12345',
    info:{
      email: 'ward.colleen.a@gmail.com',
      first_name: 'Colleen',
      last_name: 'Ward',
      image: "http://graph.facebook.com/v2.6/10100295829467675/picture",
      verified: true
    },
    credentials: {
      token: ENV['FACEBOOK_USER_TOKEN'],
      expires_at: 1500312576,
      expires: true
    }
    })

end

def stub_google
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
    provider: 'google',
    uid: "108878560139118396968",
    info: {
      name: "Beth K",
      email: "bethknight1234@gmail.com",
      first_name: "Beth",
      last_name: "K",
      image: "https://lh6.googleusercontent.com/-LLQghVrGuz8/AAAAAAAAAAI/AAAAAAAAAeY/NvLBwfaHEJA/s50-c/photo.jpg"
    },
    credentials: {
      token: "ya29.GltOBEMN4S-ke5aQEWsZTWx2VN4gW0sZ3TzpE4AcYd6662RG0e2DBGl-LS9grUTCBwdOR7IEfLiwoAVLsZqTDxVstAS1NDpvmZ33DQ40hNllWSzAIja7b6ZlYlQ-",
      refresh_token: "1/V-yVGxQuMFwZrafORBiXVvBNn3bhvocQ7lliukW9FaQ",
      expires_at: 1495138014,
      expires: true
    }
  })

end
