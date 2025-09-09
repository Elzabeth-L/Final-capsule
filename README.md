# TrackShip India - Logistics Tracking Application

A full-stack logistics tracking application built with Node.js, Express.js, MongoDB, and vanilla JavaScript frontend.

## Features

- **User Authentication**: Register, login, and profile management
- **Shipment Tracking**: Real-time tracking with detailed status updates
- **Dashboard**: Admin and user dashboards with analytics
- **API Integration**: RESTful API for all operations
- **Responsive Design**: Mobile-friendly interface
- **Real-time Chat**: AI-powered customer support

## Tech Stack

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **MongoDB** - Database
- **Mongoose** - ODM for MongoDB
- **JWT** - Authentication tokens
- **bcryptjs** - Password hashing
- **Express Validator** - Input validation
- **Helmet** - Security headers
- **CORS** - Cross-origin resource sharing

### Frontend
- **HTML5** - Markup
- **CSS3** - Styling (Tailwind CSS via CDN)
- **JavaScript** - Client-side logic
- **Leaflet** - Interactive maps
- **Font Awesome** - Icons

## Project Structure

```
logistics-tracker/
├── models/
│   ├── User.js              # User data model
│   └── Shipment.js          # Shipment data model
├── routes/
│   ├── auth.js              # Authentication routes
│   ├── shipments.js         # Shipment management routes
│   └── users.js             # User management routes
├── middleware/
│   └── auth.js              # Authentication middleware
├── *.html                   # Frontend HTML pages
├── api-client.js            # Frontend API client
├── server.js                # Main server file
├── package.json             # Dependencies and scripts
├── .env                     # Environment variables
└── README.md                # This file
```

## Installation

1. **Clone or download the project**
   ```bash
   cd C:\Users\shaik.Hamadi\Desktop\logistics-tracker
   ```

2. **Install MongoDB**
   - Download MongoDB Community Server from https://www.mongodb.com/try/download/community
   - Install and start MongoDB service
   - MongoDB will run on `mongodb://localhost:27017` by default

3. **Install Node.js dependencies**
   ```bash
   npm install
   ```

4. **Configure environment variables**
   - The `.env` file is already created with default values
   - For production, change the JWT_SECRET and other sensitive values
   ```env
   MONGODB_URI=mongodb://localhost:27017/logistics-tracker
   JWT_SECRET=your-super-secret-jwt-key-change-this-in-production
   PORT=3000
   NODE_ENV=development
   ```

## Running the Application

1. **Start MongoDB** (if not running as a service)
   ```bash
   mongod
   ```

2. **Start the server**
   ```bash
   npm start
   # or for development with auto-restart
   npm run dev
   ```

3. **Access the application**
   - Open your browser and go to: http://localhost:3000
   - The server will serve your HTML files and provide API endpoints

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - User login
- `GET /api/auth/me` - Get current user info
- `PUT /api/auth/profile` - Update user profile
- `POST /api/auth/change-password` - Change password
- `POST /api/auth/logout` - Logout user

### Shipments
- `GET /api/shipments/track/:trackingNumber` - Track shipment (public)
- `POST /api/shipments` - Create new shipment (authenticated)
- `GET /api/shipments/my` - Get user's shipments
- `PUT /api/shipments/:id/tracking` - Add tracking event (agent/admin)
- `GET /api/shipments/dashboard/stats` - Get dashboard statistics
- `GET /api/shipments/sample-data` - Get sample tracking data

### Users
- `GET /api/users/profile` - Get user profile
- `GET /api/users` - Get all users (admin only)

### System
- `GET /api/health` - Health check endpoint

## Sample Data

For testing, you can use these sample tracking numbers:
- `IND123456789` - In Transit
- `IND987654321` - Out for Delivery
- `IND456789123` - Delivered

## Frontend Integration

The frontend uses the `api-client.js` file to communicate with the backend:

```javascript
// Example usage
const api = new TrackShipAPI();

// Register user
await api.register({
    fullName: 'John Doe',
    email: 'john@example.com',
    phone: '9876543210',
    password: 'Password123'
});

// Track shipment
const trackingData = await api.trackShipment('IND123456789');
```

## Development

### Adding New Features

1. **Backend**: Add routes in the `routes/` directory
2. **Frontend**: Update the `api-client.js` and HTML files
3. **Database**: Add/modify models in the `models/` directory

### Environment Variables

- `MONGODB_URI`: MongoDB connection string
- `JWT_SECRET`: Secret key for JWT tokens
- `PORT`: Server port (default: 3000)
- `NODE_ENV`: Environment (development/production)

## Security Features

- Password hashing with bcryptjs
- JWT token authentication
- Input validation and sanitization
- Rate limiting on API endpoints
- Security headers with Helmet
- CORS configuration

## Troubleshooting

### Common Issues

1. **MongoDB Connection Error**
   - Make sure MongoDB is running
   - Check the connection string in `.env`

2. **Port Already in Use**
   - Change the PORT in `.env` file
   - Or stop other applications using port 3000

3. **JWT Token Errors**
   - Make sure JWT_SECRET is set in `.env`
   - Token might be expired, try logging in again

### Logs

The server logs important information to the console. Check the terminal for:
- Database connection status
- Server startup confirmation
- API request errors

## Production Deployment

1. **Set environment variables**
   ```env
   NODE_ENV=production
   MONGODB_URI=mongodb://your-production-db
   JWT_SECRET=your-secure-secret-key
   PORT=80
   ```

2. **Build optimizations**
   - Enable Helmet CSP
   - Configure CORS for your domain
   - Set up HTTPS

3. **Process management**
   ```bash
   npm install -g pm2
   pm2 start server.js --name "logistics-tracker"
   ```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the ISC License.

## Support

For support, email support@trackship.in or create an issue in the repository.
