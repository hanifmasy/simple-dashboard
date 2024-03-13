<template>
  <div>

    <div class="field">
      <button @click="logout" class="button is-primary is-pulled-left">Logout</button>
    </div>


    <div class="has-text-centered">
      <h2>Dashboard</h2>
    </div>

    <div>
        <h4>Asset Count</h4>
          <p>Assets based on City: <b>{{ cityAssetCount }}</b> </p>
          <p>Assets based on Continent: <b>{{ continentAssetCount }}</b> </p>
    </div>

    <br><hr>
    <p class="has-text-centered has-text-weight-bold">{{ errorMessage }}</p>
      <div class="filters">
          <label for="cityFilter">City Location:</label>
          <select v-model="cityFilter">
            <option value="">All</option>
            <option v-for="city in cityOptions" :key="city">{{ city }}</option>
          </select>
      </div>
      <br>
      <div class="filters">
          <label for="contFilter">Continents:</label>
          <select v-model="contFilter">
            <option value="">All</option>
            <option v-for="cont in contOptions" :key="cont">{{ cont }}</option>
          </select>
      </div>
    <br>
    <table>
      <thead>
        <tr>
          <th>Asset</th>
          <th>Value ($)</th>
          <th>Location</th>
          <th>Continent</th>
          <th>Holding Duration</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(asset, index) in filteredAssets" :key="index">
          <td>{{ asset.name }}</td>
          <td>{{ asset.value }}</td>
          <td>{{ asset.location }}</td>
          <td>{{ asset.continent }}</td>
          <td>{{ asset.duration }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      errorMessage: '',
      assets: [],
      cityFilter: '',
      contFilter: ''
    }
  },
  computed: {
    filteredAssets() {
      let filtered = this.assets;

      if (this.cityFilter) {
        filtered = filtered.filter(asset => asset.location.toLowerCase().includes(this.cityFilter.toLowerCase()));
      }

      if (this.contFilter) {
        filtered = filtered.filter(asset => asset.continent.toLowerCase().includes(this.contFilter.toLowerCase()));
      }

      return filtered;
    },
    cityOptions() {
      let cities = this.assets.map(item => item.location);
      return cities;
    },
    contOptions() {
        const uniqueContinents = new Set(this.assets.map(item => item.continent.toLowerCase()));
        return [...uniqueContinents];
    },
    cityAssetCount() {
        const cityCounts = {};
        this.assets.forEach(asset => {
            const city = asset.location.toLowerCase();
            cityCounts[city] = (cityCounts[city] || 0) + 1;
        });
        return Object.keys(cityCounts).length;
    },
    continentAssetCount() {
        const continentCounts = {};
        this.assets.forEach(asset => {
            const continent = asset.continent.toLowerCase();
            continentCounts[continent] = (continentCounts[continent] || 0) + 1;
        });
        return Object.keys(continentCounts).length;
    }
  },
  methods: {
    async logout() {
      try {
        const response = await fetch('http://localhost:3000/logout', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          }
        });
        if (response.ok) {
          localStorage.removeItem('token');
          this.$router.push('/login');
        } else {
          this.errorMessage = 'Failed to logout';
        }
      } catch (error) {
        console.error('Error logging out:', error);
        this.errorMessage = 'Error logging out';
      }
    },
    async fetchAssets() {
      try {
        const response = await fetch('http://localhost:3000/assets', {
          method: 'GET',
          headers: {
            'Authorization': `Bearer ${localStorage.getItem('token')}`
          }
        });
        if (response.ok) {
          this.assets = await response.json();
        } else {
          throw new Error('Failed to fetch assets');
        }
      } catch (error) {
        this.errorMessage = 'Error fetching assets';
      }
    }
  },
  mounted() {
    const token = localStorage.getItem('token');
    if (!token) {
      this.$router.push('/login');
    } else {
      this.fetchAssets();
    }
  }
}
</script>

<style>
.has-text-weight-bold {
  font-weight: bold;
}
.has-text-centered {
  text-align: center;
}
table {
  width: 100%;
  border-collapse: collapse;
}
th, td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}
th {
  background-color: #f2f2f2;
}
</style>
