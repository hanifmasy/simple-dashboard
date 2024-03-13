<template>
  <div class="container">
    <h2 class="title has-text-centered">Login</h2>
    <form @submit.prevent="login" class="box">

    <div class="field is-horizontal">
      <div class="field-label is-normal">
        <label class="label">Username</label>
      </div>
      <div class="field-body">
        <div class="field">
          <p class="control">
            <input class="input" type="username" v-model="username" autocomplete="off" required>
          </p>
        </div>
      </div>
      </div>

      <div class="field is-horizontal">
      <div class="field-label is-normal">
        <label class="label">Password</label>
      </div>
      <div class="field-body">
        <div class="field">
          <p class="control">
            <input class="input" type="password" v-model="password" autocomplete="off" required>
          </p>
        </div>
      </div>
      </div>

      <div class="field">
        <div class="control">
          <button type="submit" class="button is-primary">Login</button>
          <button type="button" class="button is-link" @click="goToSignUp">Sign Up</button>
        </div>
      </div>

    </form>
    <p>{{ errorMessage }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      password: '',
      errorMessage: ''
    }
  },
  methods: {
    async login() {
      try {
        const response = await fetch('http://localhost:3000/login', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            username: this.username,
            password: this.password
          })
        });
        const data = await response.json();
        if (response.ok) {
          localStorage.setItem('token', data.token);
          this.$router.push('/dashboard');
        } else {
          this.errorMessage = data.message;
        }
      } catch (error) {
        this.errorMessage = 'Error logging in';
      }
    },
    goToSignUp() {
      try {
        fetch('http://localhost:3000/signup', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            username: this.username,
            password: this.password
          })
        })
        .then(response => {
          if (response.ok) {
            this.$router.push('/login').catch(()=>{});
          } else {
            return response.json();
          }
        })
        .then(data => {
          if (data) {
            this.errorMessage = data.message;
          }
        });
      } catch (error) {
        this.errorMessage = 'Error signing up';
      }
    }
  }
}
</script>

<style>
.container {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
}

.box {
  background-color: #f9f9f9;
  border-radius: 5px;
  padding: 20px;
}

.title {
  margin-bottom: 20px;
}
</style>
